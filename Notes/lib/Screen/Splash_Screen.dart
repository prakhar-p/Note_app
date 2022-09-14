
import 'package:flutter/material.dart';
import 'package:notes/Screen/home.dart';

const title = TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'handwritten');
class Splash_Screen extends StatefulWidget {
  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.orange[800] ,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 80.0),
              Image.asset('Images/logo.png'),
              SizedBox(
                height: 100.0,

              ),
              Text('Notes', style: title),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => Home(
            //title: 'title',
          )),
    );
  }
}
