import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:auto_animated/auto_animated.dart';
import '../../refrence.dart';
import '../../widgets/Requestlist.dart';
class Req_list extends StatefulWidget {
  static const scid="req_list";
  const Req_list({Key? key}) : super(key: key);


  @override
  State<Req_list> createState() => _Req_list();
}

class _Req_list extends State<Req_list> {

  // Build animated item (helper for all examples)
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return Scaffold(
      backgroundColor: Colors.white.withOpacity(.95),

      key: scaffoldKey,
      endDrawer: Mydrawer(),
      appBar: AppBar(
        backgroundColor: Colors.orange[100],
        leading: Container(
          margin: EdgeInsets.only(left: width/60),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color:Color.fromRGBO(204, 88, 76, 1),
                    shape: BoxShape.circle
                ),
                height: height/10,
                width: width/10.3,

              ),
              Container(
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/img/tantawy.jpg'),
                ),
                height: height/10.1,
                width: width/12.8,

              ),

            ],
          ),
        ),
        leadingWidth: width/10,
        actions: <Widget>[
          IconButton(
            icon: Container(
                height: height/25,
                width: width/12,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                ),
                child: Icon(Icons.settings)),
            tooltip: 'Setting Icon',
            color: Color.fromRGBO(204, 88, 76, 1),
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
                child: Icon(Icons.menu)),
            tooltip: 'Setting Icon',
            color: Color.fromRGBO(204, 88, 76, 1),
            onPressed:() => scaffoldKey.currentState!.openEndDrawer(),
          ), //Ic

        ], //<Widget>[]
      ),

      body:Reqlist(),

    );
  }
}
