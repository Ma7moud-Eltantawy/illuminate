import 'package:flutter/material.dart';
class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);
  static const scid="home_screen";

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
