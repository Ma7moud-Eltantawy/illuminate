import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Screens/Login.dart';
void alertfunc({required BuildContext ctx,required double height,required double width,required String desc,
required String buttxt2,required Function but1, required Function but2

})
{
  Alert(
    context: ctx,
    type: AlertType.warning,
    title: "!انتبه",
    desc: desc,
    buttons: [
      DialogButton(
        child: Text(
          buttxt2,
          style: TextStyle(color: Colors.white, fontSize: width/30),
        ),
        onPressed: () {
          but1();
        },
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          "محاوله مره اخرى",
          style: TextStyle(color: Colors.white, fontSize: width/30),
        ),
        onPressed: () {
          but2();
        },
        gradient: LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
      )
    ],
  ).show();

}
