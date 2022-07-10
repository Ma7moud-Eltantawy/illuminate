import 'package:flutter/material.dart';

class Stu_app_bar{


  static getAppBar({required double height,required double width,required Function onpress}) {

   return  AppBar(
      backgroundColor: Colors.orange[100],
      leading: Container(
        margin: EdgeInsets.only(left: width/60),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                  color:Color.fromRGBO(204, 88, 76, 1),
                  shape: BoxShape.circle
              ),
              height: height/10,
              width: width/10.3,

            ),
            SizedBox(
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/img/tantawy.jpg'),
              ),
              height: height/10.1,
              width: width/12.8,

            ),

          ],
        ),
      ),
      leadingWidth:width/10,
      actions: <Widget>[
        IconButton(
          icon: Container(
              height: height/25,
              width: width/12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: const Icon(Icons.settings)),
          tooltip: 'Setting Icon',
          color: const Color.fromRGBO(204, 88, 76, 1),
          onPressed: () {},
        ), //Ic// onButton
        IconButton(
          icon: Container(
              height: height/25,
              width: width/12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: const Icon(Icons.menu)),
          tooltip: 'Setting Icon',
          color: const Color.fromRGBO(204, 88, 76, 1),
          onPressed: onpress(),
        ), //Ic

      ], //<Widget>[]
    );
  }
}
