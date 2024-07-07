import 'package:commerce/models/product_model.dart';
import 'package:commerce/models/user_model.dart';
import 'package:commerce/pages/homescreen_one.dart';
import 'package:commerce/providerz/e_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Congratulations extends StatefulWidget {
  const Congratulations({super.key});

  @override
  State<Congratulations> createState() => _CongratulationsState();
}

class _CongratulationsState extends State<Congratulations> {

  Product? product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageClass(),
              CongratulationsText(),
              SizedBox(
                height: 15.0,
              ),
              OrderText(),
              SizedBox(
                height: 30.0,
              ),
              ContimueButton()
            ],
          ),
        ),
      ),
    );
  }
}

class ImageClass extends StatelessWidget {
  const ImageClass({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 200.0,
      child: Image.asset('assets/tik.jpg',fit: BoxFit.cover),
    );
  }
}

class CongratulationsText extends StatelessWidget {
  const CongratulationsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Congratulations!!!',
        style: TextStyle(color: Colors.black, fontSize: 24.0,
            fontWeight: FontWeight.bold));
  }
}

class OrderText extends StatelessWidget {
  const OrderText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Your Order has been Placed Successfully',
        style: TextStyle(color: Colors.black,fontSize: 16.0));
  }
}

class ContimueButton extends StatelessWidget {

  const ContimueButton({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 150.0,
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

            Navigator.push(context, MaterialPageRoute(builder: (context) => HomescreenOne(name: '')));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              )
          ),
          child: Text('Continue Shopping',style: TextStyle(color: Color(0xffFFA451)))
      ),
    );
  }
}




