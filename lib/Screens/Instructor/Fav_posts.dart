import 'package:flutter/material.dart';
class Fav_List_Screen extends StatefulWidget {
  const Fav_List_Screen({Key? key}) : super(key: key);

  @override
  State<Fav_List_Screen> createState() => _Fav_List_ScreenState();
}

class _Fav_List_ScreenState extends State<Fav_List_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Text("Fav_Screen"),
      ),
    );
  }
}
