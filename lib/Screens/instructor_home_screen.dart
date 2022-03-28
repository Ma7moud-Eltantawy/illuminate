import 'package:flutter/material.dart';
class Instrictor_home_screen extends StatefulWidget {
  static const scid="IHS";
  const Instrictor_home_screen({Key? key}) : super(key: key);

  @override
  State<Instrictor_home_screen> createState() => _Instrictor_home_screenState();
}

class _Instrictor_home_screenState extends State<Instrictor_home_screen> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return Scaffold(
      appBar: AppBar(),
    );
  }
}
