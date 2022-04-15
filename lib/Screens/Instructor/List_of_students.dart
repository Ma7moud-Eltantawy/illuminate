import 'package:flutter/material.dart';
class Stu_List_Screen extends StatefulWidget {
  const Stu_List_Screen({Key? key}) : super(key: key);

  @override
  State<Stu_List_Screen> createState() => _Stu_List_ScreenState();
}

class _Stu_List_ScreenState extends State<Stu_List_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child:Text("stu_Screen"),
      ),
    );
  }
}
