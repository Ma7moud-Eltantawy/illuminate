import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:illuminate/Screens/Instructor/Fav_posts.dart';
import 'package:illuminate/Screens/Instructor/Home_page.dart';
import 'package:illuminate/Screens/Instructor/List_of_students.dart';
import 'package:illuminate/Screens/Instructor/add_post.dart';
import 'package:illuminate/Screens/Instructor/requests_list.dart';
import 'package:illuminate/networks/get_data/Get_pending_requests.dart';
import 'package:illuminate/providers/Prov_Theme_status.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../../providers/Check_connected.dart';
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
    var pro=Provider.of<Prov_theme_status>(context).active_switch;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

    @override
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    var ActiveIndex;
    List<Widget> insScreenList=[
      const Ins_Home_Category(),
      const Fav_List_Screen(),
      const Bot_Nav_reqlist(),
      const Stu_List_Screen(),

    ];

    var scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 2,
          backgroundColor:Theme.of(context).appBarTheme.backgroundColor,
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
                  child: Consumer<Prov_Shared_Pref>(
                    builder:(context,prov,ch)=> Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage('http://mohamedelbadry.me/illuminate/${Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.image.toString()}'),
                          fit: BoxFit.cover,
                        )
                      ),


                     //
                    ),
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
              icon: Consumer<Prov_Pinding_Requests>(
                builder: (context,pr,ch)=>Badge(
                  badgeColor: const Color.fromRGBO(204, 88, 76, 1),
                  badgeContent: FutureBuilder(
                    future: pr.getrequests(),
                    builder:(context,snaoshot)=> Text(pr.requests_list.length.toString(),style: const TextStyle(
                      color: Colors.white
                    ),),
                  ),
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
                            color: Theme.of(context).backgroundColor
                        ),

                            child: const Icon(Icons.group_add_outlined)),
                  ),
                ),
              ),
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
                      color:Theme.of(context).backgroundColor
                  ),
                  child: const Icon(Icons.menu)),
              tooltip: 'Setting Icon',
              color: const Color.fromRGBO(204, 88, 76, 1),
              onPressed:() => scaffoldKey.currentState!.openEndDrawer(),
            ), //Ic

          ], //<Widget>[]
        ),
        endDrawer: const Mydrawer(),

        floatingActionButton: FloatingActionButton(
          elevation: 10,
          child: Icon(Icons.add,
            color:Theme.of(context).floatingActionButtonTheme.focusColor,),
          onPressed: () {
            Navigator.of(context).pushNamed(Add_post_screen.scid);
          },
          backgroundColor: const Color.fromRGBO(204, 88, 76, 1)
          //params
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Consumer<Login_signup_prov>(
          builder:(context,pr,ch)=> Container(
            color: Theme.of(context).backgroundColor,
            child: AnimatedBottomNavigationBar(
              icons: const [
                Icons.home_outlined,
                Icons.favorite_border,
                Icons.contact_mail_outlined,
                Icons.person_outline,
              ],
              backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
              notchMargin: 10,
              

              activeColor:const Color.fromRGBO(204, 88, 76, 1),
              inactiveColor:Theme.of(context).iconTheme.color,
              activeIndex: pr.activenum,
              gapLocation: GapLocation.center,
              notchSmoothness: NotchSmoothness.softEdge,
              onTap:(index){
                pr.chahnge_active(index);
              },
              //other params
            ),
          ),
        ),
        body:FutureBuilder(
          builder:(context,snapshot)=>snapshot.connectionState==ConnectionState.waiting?Center(child: CircularProgressIndicator(),): Consumer<Prov_Check_connect>(
            builder: (context,pr,ch)=>FutureBuilder(
              future: pr.check_internet(),
              builder: (context,snapshot)=> pr.net_connected==true?
              RefreshIndicator(
                child: Consumer<Login_signup_prov>(builder:(context,prov,ch)=>insScreenList[prov.activenum] ),
                // Function that will be called when
                // user pulls the ListView downward
                onRefresh: () {
                  return Future.delayed(
                    Duration(seconds: 1),
                        () {
                      /// adding elements in list after [1 seconds] delay
                      /// to mimic network call
                      ///
                      /// Remember: [setState] is necessary so that
                      /// build method will run again otherwise
                      /// list will not show all elements
                      setState(() {

                      });

                      // showing snackbar
                      _scaffoldKey.currentState!.showSnackBar(
                        SnackBar(
                          content: const Text('Page Refreshed'),
                        ),
                      );
                    },
                  );
                },
              )
              /*Consumer<Login_signup_prov>(builder:(context,prov,ch)=>insScreenList[prov.activenum] )*/:Center(
                child:Container(
                 decoration: const BoxDecoration(
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
        ),

      );
  }
}
