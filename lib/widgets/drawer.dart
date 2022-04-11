import 'package:flutter/material.dart';

import '../refrence.dart';
class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SizedBox(
      width: width/1.3,
      child: ClipRRect(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
        child: Drawer(
          backgroundColor: Colors.white,
          child: ListView(

            children: [


              Container(
                height: height/3,
                child: DrawerHeader(
                  child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: height/5.5,
                            width: width/2,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [
                                      Color.fromRGBO(220, 75, 76, 1),
                                      Color.fromRGBO(240, 223, 167, 1),
                                    ]
                                )
                            ),
                          ),
                          Container(
                            height: height/5.75,
                            width: width/2.25,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                            ),
                          ),
                          Container(
                            height: height/6,
                            width: width/2.5,
                            child: CircleAvatar(
                              backgroundImage: AssetImage('assets/img/tantawy.jpg'),
                            ),
                          ),
                        ],)
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),),
              ),
              for(var item in drawerlist)
                Column(
                  children: [
                    ListTile(
                      title: item['title'],
                      leading: item['icon'],
                      onTap: (){
                        item['func'](context);
                      },
                    ),
                    Container(
                      height: height/1000,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(220, 75, 76, 1),
                                Color.fromRGBO(240, 223, 167, 1),
                              ]
                          )
                      ),
                    ),

                  ],
                ),




            ],
          ),
        ),
      ),
    );
  }
}
