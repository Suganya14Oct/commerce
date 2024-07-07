import 'package:commerce/models/cart_model.dart';
import 'package:commerce/models/product_model.dart';
import 'package:commerce/pages/ProductDetailsScreen.dart';
import 'package:commerce/pages/congratulations.dart';
import 'package:commerce/providerz/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyBasketPage extends StatefulWidget {

  final String productName;
  final int quantity;
  final int price;
  final String image;

  const MyBasketPage({required this.productName, required this. quantity, required this.price, required this.image, super.key});

  @override
  State<MyBasketPage> createState() => _MyBasketPageState();
}

class _MyBasketPageState extends State<MyBasketPage> {

  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    final cartState = Provider.of<AddtoCart>(context, listen: false);

    double grandTotal = 0.0;
    for (CartModel cartItem in cartState.state.items) {
      String priceString = cartItem.product.price.toString();
      double price = double.tryParse(priceString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;
      grandTotal += price * cartItem.quantity;
    }

    print('No. of items in cart: ${cartState.state.items.length}');

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: GobackButton(),
              ),
              SizedBox(width: 45.0),
              Padding(
                padding: EdgeInsets.only(top: 14.0),
                child: Text("My Basket", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          backgroundColor: Color(0xffFFA451),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Container(
          height: h,
          width: w,
          child: cartState.state.items == null  ?  Center(child: Text('Your basket is empty.')) :
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: cartState.state.items.length,
                    itemBuilder: (context, index) {
                      CartModel cartItem = cartState.state.items[index];

                      String priceString = cartItem.product.price.toString();
                      double price = double.tryParse(priceString.replaceAll(RegExp(r'[^0-9.]'), '')) ?? 0.0;

                      return ListTile(
                        leading: Image.asset(
                          cartItem.product.image,
                          width: 60.0, height: 60.0,
                          fit: BoxFit.cover,
                        ),
                        title: Text(cartItem.product.name,style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Price: \$${cartItem.product.price}',style: TextStyle(fontSize: 17.0)),
                            Text('Quantity: ${cartItem.quantity}',style: TextStyle(fontSize: 17.0)),
                          ],
                        ),
                        trailing: Text( 'Total: \$${(price * cartItem.quantity).toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                        ),
                      );
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Grand Total: \$${grandTotal.toStringAsFixed(2)}',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Container(
                       width: 150.0,
                       height: 50.0,
                       child: ElevatedButton(
                               onPressed: (){
                                 setState(() {
                                   _bottomSheet();
                                 });
                               },
                           style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(10.0),
                               backgroundColor: Color(0xffFFA451),
                             shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(10.0)
                           )
                        ),
                       child: Text('CheckOut',style: TextStyle(color: Colors.white))
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   _bottomSheet(){

    var w = MediaQuery.of(context).size.width;

     return showModalBottomSheet(
         context: context,
         builder: (BuildContext context) {
           return Container(
             height: 310.0,
             width: w,
             decoration:  BoxDecoration(
               color: Colors.white,
               borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))
             ),
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 Padding(
                   padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
                   child: Text('Delivery Address',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 30.0, right: 30.0),
                   child: Container(
                     padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: Colors.grey[200], // Optional: background color
                     ),
                     child: TextFormField(
                       controller: _addressController,
                       decoration: InputDecoration(
                           hintText: '10th avenue,Lekki,Lague State',
                           border: InputBorder.none,
                           hintStyle: TextStyle(color: Colors.grey),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.grey),
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                           filled: true,
                           fillColor: Colors.grey[200]
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
                   child: Text('Number we can call',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                 ),
                 Padding(
                   padding: EdgeInsets.only(left: 30.0, right: 30.0),
                   child: Container(
                     padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10.0),
                       color: Colors.grey[200], // Optional: background color
                     ),
                     child: TextFormField(
                       controller: _phoneController,
                       decoration: InputDecoration(
                           hintText: 'phone Number',
                           border: InputBorder.none,
                           hintStyle: TextStyle(color: Colors.grey),
                           focusedBorder: OutlineInputBorder(
                             borderSide: BorderSide(color: Colors.grey),
                             borderRadius: BorderRadius.circular(10.0),
                           ),
                           filled: true,
                           fillColor: Colors.grey[200]
                       ),
                     ),
                   ),
                 ),
                 Padding(
                   padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0,right: 20.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Container(
                         width: 130.0,
                         height: 50.0,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           border: Border.all(
                             color: Color(0xffFFA451), // Set border color
                             width: 2.0, // Set border width
                           ),
                         ),
                         child: ElevatedButton(
                             onPressed: (){
                               Navigator.push(context, MaterialPageRoute(builder: (context) => Congratulations()));
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor: Colors.white,
                                 padding: EdgeInsets.all(10.0),
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10.0),
                                 )
                             ),
                             child: Text('Pay on Delivery',style: TextStyle(color: Color(0xffFFA451)))
                         ),
                       ),
                       Container(
                         width: 130.0,
                         height: 50.0,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(10.0),
                           border: Border.all(
                             color: Color(0xffFFA451), // Set border color
                             width: 2.0, // Set border width
                           ),
                         ),
                         child: ElevatedButton(
                             onPressed: (){
                               _CardbottomSheet();
                             },
                             style: ElevatedButton.styleFrom(
                                 backgroundColor: Colors.white,
                                 padding: EdgeInsets.all(10.0),
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10.0),
                                 )
                             ),
                             child: Text('Pay with Card',style: TextStyle(color: Color(0xffFFA451)))
                         ),
                       ),
                     ],
                   ),
                 )
               ],
             ),
           );
         }
     );
   }

  _CardbottomSheet(){

    var w = MediaQuery.of(context).size.width;

    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 350.0,
            width: w,
            decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0))
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('Card Holder Name',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200], // Optional: background color
                    ),
                    child: TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                          hintText: 'card holder name',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200]
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
                  child: Text('Card Number',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[200], // Optional: background color
                    ),
                    child: TextFormField(
                      controller: _phoneController,
                      decoration: InputDecoration(
                          hintText: 'phone Number',
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: Colors.grey),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.grey[200]
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0,right: 20.0),
                    child: Container(
                      width: 130.0,
                      height: 50.0,
                      child: ElevatedButton(
                          onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Congratulations()));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFFA451),
                              padding: EdgeInsets.all(10.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )
                          ),
                          child: Text('Complete Order',style: TextStyle(color: Colors.white))
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}
