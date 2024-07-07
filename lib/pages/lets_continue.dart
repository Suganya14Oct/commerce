import 'package:commerce/pages/authenticate.dart';
import 'package:flutter/material.dart';

class LetsContinue extends StatefulWidget {
  const LetsContinue({super.key});

  @override
  State<LetsContinue> createState() => _LetsContinueState();
}

class _LetsContinueState extends State<LetsContinue> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                child: Positioned(
                  top: 0, left: 0, right: 0, bottom: height / 2.7,
                  child: Container(
                    color: Color(0xffFFA451),
                  ),
                ),
              ),
              Positioned(
                top: 100, right: 40,
                  child: Image.asset('assets/fruit.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  )
              ),
              Positioned(
                top: 150, right: 90,
                  child: Image.asset('assets/basket.png',
                    width: 220, height: 220, fit: BoxFit.cover,
                  )
              ),
              Positioned(
                bottom: 200, left: 20,
                  child: Text('Get the Freshest Fruit Salad Combo',
                    style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),)
              ),
              Positioned(
                  bottom: 143, left: 20,right: 8.0,
                  child: Text('We deliver the best and freshest fruit salad in town.\nOrder for a combo today!!!',
                    style: TextStyle(color: Colors.black, fontSize: 12.0))
              ),
              Positioned(
                  bottom: 143, left: 20,right: 8.0,
                  child: Text('We deliver the best and freshest fruit salad in town.\nOrder for a combo today!!!',
                      style: TextStyle(color: Colors.black, fontSize: 12.0))
              ),
              Positioned(
                bottom: 30, left: 47,
                child: ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Authenticate()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffFFA451),
                      padding: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )
                    ),
                    child: Text('Let\'s Continue',style: TextStyle(fontSize: 12, color: Colors.white))
                ),
              )
            ],
          )
        ),
      )
    );
  }
}
