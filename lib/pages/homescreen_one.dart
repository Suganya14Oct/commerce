import 'package:commerce/models/product_model.dart';
import 'package:commerce/models/todo_models.dart';
import 'package:commerce/models/user_model.dart';
import 'package:commerce/pages/ProductDetailsScreen.dart';
import 'package:commerce/providerz/e_user.dart';
import 'package:commerce/providerz/product_list.dart';
import 'package:commerce/providerz/todo_filter.dart';
import 'package:commerce/providerz/todo_search.dart';
import 'package:commerce/utils/debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomescreenOne extends StatefulWidget {

  final String name;
  const HomescreenOne({required this.name, super.key});

  @override
  State<HomescreenOne> createState() => _HomescreenOneState();
}

class _HomescreenOneState extends State<HomescreenOne> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoSearch>(
      builder: (context, todoSearch, _) {
       return  SafeArea(
          child: Scaffold(
            body: WillPopScope(
              onWillPop: () async {
                bool exitConfirmed = await _showExitConfirmationDialog(context);
                return exitConfirmed;
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                  child: Column(
                    children: [
                      MyBasket(),
                      SizedBox(height: 10.0),
                      Consumer<UserModelNotifier>(
                        builder: (context, userModel, _){
                          return WelcomeText(
                            name: userModel.state.user?.name ?? widget.name,
                            setUser: userModel.setUser,
                          );
                        },
                      ),
                      SizedBox(height: 20.0),
                      SearchAndFilter(),
                      SizedBox(height: 20.0),
                      if (todoSearch.state.searchTerm == null || todoSearch.state.searchTerm.isEmpty)
                      ShowProducts() else
                        SearchResultContainer(),
                    ],
                  )
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {

    bool exitConfirmed = false;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Do you want to exit the app?"),
          actions: [
            TextButton(
              onPressed: () async {
                SystemNavigator.pop();
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No'),
            )
          ],
        );
      },
    ).then((value) {
      exitConfirmed = value ?? false;
    });

    return exitConfirmed;
  }

}

class MyBasket extends StatelessWidget {
  const MyBasket({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Image.asset('assets/fruit.png'),
              Text('My Basket',style: TextStyle(color: Colors.black))
            ],
          ),
        ),
      ],
    );
  }
}

class WelcomeText extends StatelessWidget {

  final String name;
  final Function(Username) setUser;

  const WelcomeText({required this.name, required this.setUser, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Hello ${name}, What fruit salad\ncombo do you want today?',
          textAlign: TextAlign.left,
          style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class SearchAndFilter extends StatelessWidget {
  SearchAndFilter({super.key});

  final debounce = Debounce(milliseconds: 1000); // it's useful to avoid performance issues when a function gets called rapidly, such as an response to user input events like scrolling or typing

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(
              labelText: 'Search for fruit salad combos',
              border: InputBorder.none,
              filled: true,
              prefixIcon: Icon(Icons.search)
          ),
          onChanged: (String? newSearchTerm){
            if(newSearchTerm != null){
              debounce.run(() {
                context.read<TodoSearch>().setSearchTerm(newSearchTerm);
              });
            }
          },
        ),
        SizedBox(height: 25.0),
        context.watch<TodoSearch>().state.searchTerm != null &&
            context.watch<TodoSearch>().state.searchTerm!.isNotEmpty ? SearchResultContainer() :
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Recommended Combo',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0)),
              ],
            ),
            SizedBox(height: 10.0),
            Container(
              height: 230.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index){
                    return ProductCard(
                        product: products[index]
                    );
                  }
              ),
            ),
            SizedBox(height: 25.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                filterButton(context, Filter.hottest),
                filterButton(context, Filter.popular),
                filterButton(context, Filter.newCombo),
                filterButton(context, Filter.top),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget filterButton(BuildContext context, Filter filter){
    return TextButton(
      onPressed: (){
        context.read<TodoFilter>().changeFilter(filter);
      },
      child: Text(filter == Filter.hottest ? 'Hottest' : filter == Filter.popular ? 'Popular' : filter == Filter.newCombo ? 'New Combo' :  'Top',
          style: TextStyle(fontSize: 16.0, color:  textColor(context, filter))),
    );
  }

  Color textColor(BuildContext context, Filter filter){
    final currentFilter = context.watch<TodoFilter>().state.filter;
    return currentFilter == filter ? Colors.black : Colors.grey;
  }

}

class SearchResultContainer extends StatelessWidget {
  const SearchResultContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoSearch>(
      builder: (context, todoSearch, _) {
        List<Product> filteredProducts = Provider.of<ProductListState>(context).products
            .where((product) => product.name.toLowerCase().contains(todoSearch.state.searchTerm.toLowerCase()))
            .toList();

        if (todoSearch.state.searchTerm.isNotEmpty && filteredProducts.isNotEmpty) {
          return GridView.builder(
            shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 0.75,
              ),
              itemCount: filteredProducts.length,
              itemBuilder:  (context, index) {
                return ProductCard(product: filteredProducts[index]);
              },
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class ProductCard extends StatelessWidget {

  final Product product;

  const ProductCard({required this.product, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('Successfully Navigated');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsScreen(
              name: product.name,
              price: product.price,
              image: product.image,
              description: product.desc,
              product: product,
            ),
          ),
        );
      },
      child: Container(
        width: 160.0,
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: Card(
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  child: Image.asset(
                    product.image,
                    width: 160.0,
                    height: 100.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style: TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text('${product.price.toString()}',
                      style: TextStyle(fontSize: 14.0, color: Color(0xffFFA451)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('View',
                          style: TextStyle(fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xffFFA451)),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ShowProducts extends StatelessWidget {
  const ShowProducts({super.key});

  @override
  Widget build(BuildContext context) {

    final currentFilter = context.watch<TodoFilter>().state.filter;

    return Container(
      height: 230.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          itemBuilder: (context, index){
            return ProductCard(
                product: currentFilter == Filter.hottest ? hottestProducts[index] :
                currentFilter == Filter.popular ? popularProducts[index] :
                currentFilter == Filter.newCombo ? newComboProducts[index] : topProducts[index]
            );
          }
      ),
    );
  }
}





















