import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/Screens/Instructor/Fav_posts.dart';
import 'package:illuminate/Screens/Instructor/Home_page.dart';
import 'package:illuminate/Screens/Instructor/requests_list.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/providers/Prov_inst_home_page.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../providers/Check_connected.dart';
import '../../refrence.dart';
import 'Bottom_nav_Requests.dart';
class Instrictor_home_screen extends StatefulWidget {
  static const scid="IHS";
  const Instrictor_home_screen({Key? key}) : super(key: key);

  @override
  State<Instrictor_home_screen> createState() => _Instrictor_home_screenState();
}

class _Instrictor_home_screenState extends State<Instrictor_home_screen> {

  @override
  Widget build(BuildContext context) {
    @override
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    var _active_index;
    List<Widget> ins_screen_list=[
      Ins_Home_Category(),
      Fav_List_Screen(),
      Bot_Nav_reqlist(),
      Login_Screen(),

    ];

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        elevation: 2,
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
            icon: Consumer<Prov_instructor_home>(
              builder: (context,pr,ch)=>Badge(
                badgeColor: Color.fromRGBO(204, 88, 76, 1),
                badgeContent: Text(pr.Numreq().toString(),style: TextStyle(
                  color: Colors.white
                ),),
                position: BadgePosition.topEnd(top: -18,end: -10),
                child: GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushNamed(Req_list.scid);
                  },
                  child: Container(
                      height: height/25,
                      width: width/12,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white
                      ),

                          child: Icon(Icons.group_add_outlined)),
                ),
              ),
            ),
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
      endDrawer: Mydrawer(),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Color.fromRGBO(204, 88, 76, 1),),
        onPressed: () {  },
        backgroundColor: Colors.orange[50],
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Consumer<Login_signup_prov>(
        builder:(context,pr,ch)=> AnimatedBottomNavigationBar(
          icons: [
            Icons.home_outlined,
            Icons.favorite_border,
            Icons.contact_mail_outlined,
            Icons.person_outline,
          ],
          activeColor: Color.fromRGBO(204, 88, 76, 1),

          activeIndex: pr.activenum,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap:(index){
            pr.chahnge_active(index);
          },
          //other params
        ),
      ),
      body:Consumer<Prov_Check_connect>(
        builder: (context,pr,ch)=>FutureBuilder(
          future: pr.check_internet(),
          builder: (context,snapshot)=> pr.net_connected==true?
          Consumer<Login_signup_prov>(builder:(context,prov,ch)=>ins_screen_list[prov.activenum] ):Center(
            child:Container(
             decoration: BoxDecoration(
               image: DecorationImage(
                 image: AssetImage(
                   "assets/img/error.png",
                 ),
                 fit: BoxFit.contain
               )
             ),
            ),
          ),
        ),
      ),

    );
  }
}
