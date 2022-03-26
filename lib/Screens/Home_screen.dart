import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);
  static const scid="home_screen";

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {


  @override
  void initState() {
    // TODO: implement initState


  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      appBar: AppBar(
       leading: Container(
         margin: EdgeInsets.symmetric(horizontal: width/40,vertical: height/120),
         decoration: BoxDecoration(
           color: Colors.amber,
           shape: BoxShape.circle,
         ),
       ),

      ),
    );
  }
}
