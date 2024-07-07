import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleanimation;
  late Animation<Offset> _slideAnimation;


  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 650), // Adjust the duration as needed
    );
    _scaleanimation = Tween<double>(
      begin: 2.0, end: 1.0
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _slideAnimation = Tween<Offset>(
      begin: Offset(0, 1), end: Offset.zero
    ).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(
              scale: _scaleanimation,
              child: Container(
                width: 200,
                height: 100,
                color: Colors.blue,
                margin: EdgeInsets.only(bottom: 20),
                child: Center(
                  child: Text('Widget 1', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 200,
                height: 100,
                color: Colors.orange,
                child: Center(
                  child: Text('Widget 2', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
            SlideTransition(
              position: _slideAnimation,
              child: Container(
                width: 200,
                height: 100,
                color: Colors.green,
                child: Center(
                  child: Text('Widget 3', style: TextStyle(color: Colors.white)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
