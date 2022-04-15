
import 'package:flutter/material.dart';
class txtformfield extends StatelessWidget {
  txtformfield(
      {
        required this.controller,
        required this.width,
        required this.height,
        required this.hinttext,
        required this.icondata,
        required this.inputtype,
        required this.errortext,
      }
      );
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final String? hinttext;
  final String? errortext;
  final IconData? icondata;
  final TextInputType?inputtype;




  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.right,
      validator: (val)=>val!.isEmpty?"user cant be blank":null,
      controller: controller,
      keyboardType: inputtype,
      textAlignVertical: TextAlignVertical.top,
      obscureText: false,
      style: TextStyle(
          color: Theme.of(context).unselectedWidgetColor,
      ),
      decoration: InputDecoration(
        errorText: errortext,

        prefixIcon: Icon(icondata),
        hintText: hinttext,
        hintStyle: TextStyle(
            fontSize: 12,
            color: Theme.of(context).unselectedWidgetColor,

        ),

        contentPadding: EdgeInsets.only(
            right: width!/60

        ),
      ),



    );
  }
}