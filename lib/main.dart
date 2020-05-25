import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:newstime/views/home.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
//      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Homie(),
    );
  }
}

class Homie extends StatefulWidget {
  @override
  _HomieState createState() => _HomieState();
}

class _HomieState extends State<Homie> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        gradientBackground: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xffF5F7FA),
            Color(0xffB8C6DB),
          ],
        ),
        seconds: 5,
        navigateAfterSeconds: Home(),
        title: Text(
          '\nWelcome\nto\nNewsTime',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 30.0,
          ),
          textAlign: TextAlign.center,
        ),
        image: Image.asset('images/i1.png',),
        backgroundColor: Colors.white,
//        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.red);
  }
}
