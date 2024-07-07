import 'package:commerce/pages/homescreen_one.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Authenticate extends StatelessWidget {
   Authenticate({super.key});

   final _formKey = GlobalKey<FormState>();
   final TextEditingController _firstNameController = TextEditingController();

   _back(){
     return SystemNavigator.pop();
   }

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: WillPopScope(
          onWillPop: () async {
            _back();
            return false;
          },
          child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  height: height,
                  width: width,
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
                          child: Text('What is your firstname?',
                            style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black))
                      ),
                      Positioned(
                        bottom: 90, left: 47,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 20.0),
                            height: 50,
                            width: 307,
                            color: Colors.grey.shade300,
                            child: TextFormField(
                              controller: _firstNameController,
                              decoration: InputDecoration(
                                hintText: 'Tony',
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
                          )
                      ),
                      Positioned(
                        bottom: 30, left: 47,
                        child: ElevatedButton(
                            onPressed: () async {

                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomescreenOne(name: _firstNameController.text)));

                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFA451),
                                padding: EdgeInsets.symmetric(horizontal: 110, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            child: Text('Start Ordering',style: TextStyle(fontSize: 12, color: Colors.white))
                        ),
                      )
                    ],
                  ),
                ),
              )
          ),
        )
    );
  }
}
