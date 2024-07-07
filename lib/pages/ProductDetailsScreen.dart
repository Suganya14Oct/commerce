import 'package:commerce/models/cart_model.dart';
import 'package:commerce/models/product_model.dart';
import 'package:commerce/pages/homescreen_one.dart';
import 'package:commerce/pages/my_basket.dart';
import 'package:commerce/providerz/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {

  final String name;
  final int price;
  final String image;
  final String description;

  final Product product;

  ProductDetailsScreen({required this.name, required this.price, required this.image, required this.description, required this.product, super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: SingleChildScrollView(
            child: Container(
              height: h,
              width: w,
              //padding: EdgeInsets.all(8.0),
              color: Color(0xffFFA451),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GobackButton(),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        ShowImage(
                          image: widget.image.toString(),
                        ),
                        SizedBox(height: 30.0),
                        DetailedDescription(
                            name: widget.name.toString(),
                            price: widget.price,image: widget.image.toString(), description: widget.description.toString(),
                        ),
                        SizedBox(height: 25.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GobackButton extends StatelessWidget {
  const GobackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.chevron_left_outlined,size: 25.0,weight: 50.0),
              Text('Go back',style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ],
    );
  }
}

class ShowImage extends StatelessWidget {

  final String image;

  const ShowImage({required this.image, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 200.0,
          width: 200.0,
          decoration: BoxDecoration(
            borderRadius:  BorderRadius.circular(10.0),
          ),
          child: Image.asset(image,fit: BoxFit.fill,),),
    );
  }
}

class DetailedDescription extends StatefulWidget {

  final String name;
  final int price;
  final String image;
  final String description;

  DetailedDescription({required this.name, required this.price, required this.image, required this.description, super.key});

  @override
  State<DetailedDescription> createState() => _DetailedDescriptionState();
}

class _DetailedDescriptionState extends State<DetailedDescription> {

  int _itemCount = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 414.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ShowTitle(),
          ),
          //SizedBox(height: 20.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AmountContainer(
              price: widget.price,
              itemCount: _itemCount,
              onItemCountChanged: (newCount) {
                setState(() {
                  _itemCount = newCount;
                });
              }
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: Colors.grey.shade200,thickness: 1),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0,left: 9.0),
            child: SideText(),
          ),
          Divider(color: Color(0xffFFA451),thickness: 2,indent: 10.0, endIndent: 210.0),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: DescText(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(color: Colors.grey.shade200,thickness: 1),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductText(),
          ),
          Center(child: AddToBasketButton(
            productName: widget.name,
            quantity: _itemCount,
            price: widget.price,
            image: widget.image,
          )),
          SizedBox(height: 30.0)
        ],
      ),
    );
  }

  Widget ShowTitle() {
    return Text(widget.name,style: TextStyle(color: Colors.grey.shade900,fontSize: 27.0,fontWeight: FontWeight.bold));
  }

  Widget SideText() {
    return Text('One Pack Contains:',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 17.0));
  }

  Widget DescText() {
    return Text(widget.description, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold));
  }

  Widget ProductText() {
    return Text('If You are looking for a new fruit Salad to eat today,\n${widget.name}.is the perfect brunch for you',
      style: TextStyle(color: Colors.grey[800],fontSize: 13.0),
    );
  }
}

class AmountContainer extends StatefulWidget {

  final int price;
  final int itemCount;
  final ValueChanged<int> onItemCountChanged;

  const AmountContainer({required this.price, required this.itemCount, required this.onItemCountChanged, super.key});

  @override
  State<AmountContainer> createState() => _AmountContainerState();
}

class _AmountContainerState extends State<AmountContainer> {

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  if(widget.itemCount > 0){
                    widget.onItemCountChanged(widget.itemCount - 1);
                    print(widget.itemCount);
                  }
                });
              },
                child: Icon(Icons.remove_circle_outline,size: 28.0,color: Colors.grey)),
            SizedBox(width: 10.0),
            Text(widget.itemCount.toString(),style: TextStyle(color: Colors.black)),
            SizedBox(width: 10.0),
            InkWell(
                onTap: (){
                  setState(() {
                    widget.onItemCountChanged(widget.itemCount + 1);
                    print(widget.itemCount);
                  });
                },
                child: Icon(Icons.add_circle_outline,size: 28.0,color: Colors.grey)),
          ],
        ),
        Text('${widget.price.toString()}',style: TextStyle(color: Color(0xffFFA451),fontWeight: FontWeight.bold,fontSize: 17.0))
      ],
    );
  }
}

class AddToBasketButton extends StatelessWidget {

  final String productName;
  final int quantity;
  final int price;
  final String image;

  const AddToBasketButton({required this.productName, required this.quantity, required this.price, required this.image, super.key});

  @override
  Widget build(BuildContext context) {

    final product = Product(
      name: productName,
      price: price,
      image: image,
      desc: '', // Provide description if available
      id: 0, // Provide an ID or adjust as necessary
    );

    return Container(
      width: 200.0,
      height: 50.0,
      child: ElevatedButton(
          onPressed: (){
            addToCart(context, product);
            Navigator.push(context, MaterialPageRoute(builder: (context) => MyBasketPage(
                productName: productName, quantity: quantity, price: price, image: image
            )));
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
            backgroundColor: Color(0xffFFA451),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            )
          ),
          child: Text('Add to basket',style: TextStyle(color: Colors.white))
      ),
    );
  }

  void addToCart(BuildContext context, Product product) {

    final cart = Provider.of<AddtoCart>(context, listen: false);

    CartModel cartItem = CartModel(product: product, quantity: quantity);

    cart.addToCart(cartItem);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$productName added to cart'),
        duration: Duration(seconds: 2),
      )
    );
  }

}





