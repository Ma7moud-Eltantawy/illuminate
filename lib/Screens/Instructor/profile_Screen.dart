
import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Instructor/My_posts.dart';
import 'package:illuminate/Screens/Instructor/add_post.dart';
import 'package:illuminate/networks/get_data/Accept_request.dart';
import 'package:illuminate/networks/models/Profile_id_model.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/Change_Profile_screen.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';

import '../../networks/get_data/get_posts.dart';
class Profile_Screen extends StatefulWidget {
  const Profile_Screen({Key? key}) : super(key: key);
  static const scid="instructor_profile_Screen";



  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();

}

class _Profile_ScreenState extends State<Profile_Screen> {
  void initState() {


    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<ScaffoldState> drawerkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var shared=Provider.of<Prov_Shared_Pref>(context,listen: false);
    var shared_data=shared.teach_prof_data!=null?Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!:null;

    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    final List<String> _tabs = <String>['assets/img/sn_myPost.png', 'assets/img/fav.png'];
    return  DefaultTabController(
          length: _tabs.length, // This is the number of tabs.
          child: SafeArea(
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Theme.of(context).backgroundColor,
                elevation: 0,
                title: Row(
                  children: [
                    Text(shared.teach_prof_data!=null?shared_data!.name.toString():"",style:Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontSize: height/60,
                      fontFamily:'cairo'
                    ),),
                    IconButton(onPressed: (){
                      Scaffold.of(context).openEndDrawer();
                    }, icon: const Icon(Icons.keyboard_arrow_down_outlined,)),
                  ],
                ),

                leading: IconButton(icon: const Icon(Icons.add,),onPressed: (){
                  Navigator.of(context).pushNamed(Add_post_screen.scid);

                },),

              ),
              body: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      backgroundColor: Theme.of(context).backgroundColor,
                        leading: Container(),
                        floating: true,
                        pinned: true,

                        actions: [Container()],
                        expandedHeight: height/3,
                        // scroll views.
                        forceElevated: innerBoxIsScrolled,
                        bottom: TabBar(
                          indicatorColor: Theme.of(context).unselectedWidgetColor,
                          // These are the widgets to put in each tab in the tab bar.
                          tabs: _tabs.map((String name) => Tab(icon: Image.asset(name),height: 35,)).toList(),
                        ),
                      flexibleSpace: FlexibleSpaceBar(
                        collapseMode: CollapseMode.parallax,
                        background: Container(
                          child:Padding(
                            padding: EdgeInsets.symmetric(vertical: height/20,horizontal: width/25),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(

                                   children: [
                                     Stack(
                                       children: [
                                         shared.teach_prof_data!=null?
                                         Consumer<Prov_Shared_Pref>(
                                           builder:(context,prov,ch)=> (
                                              CircleAvatar(
                                               backgroundImage: NetworkImage('http://mohamedelbadry.me/illuminate/${Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.image}'),
                                               radius: width/9,
                                             )
                                           ),
                                         ):CircleAvatar(
                                           backgroundImage: AssetImage('assets/img/back.png'),
                                           radius: width/9,
                                         ),

                                       ],
                                     ),
                                     SizedBox(
                                       width: width/16,
                                     ),
                                    Expanded(child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Text("${Provider.of<Prov_get_posts>(context,listen: false).Likes_posts(Provider.of<Prov_Shared_Pref>(context,listen:false).teach_prof_data!.data!.profile!.id!.toInt()).length}",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize:   height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text("الاعجابات",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize:height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("${Provider.of<Prov_accept_req>(context,listen: false).acceptation_map.length}",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text("الطلاب",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text("${Provider.of<Prov_get_posts>(context,listen: false).posts_list.where((element) => element.userId==Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.id).length}",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                              textAlign: TextAlign.center,),
                                            Text("المنشورات",style: Theme.of(context).textTheme.headline1!.copyWith(
                                              fontSize: height/50,
                                              fontWeight: FontWeight.w900,
                                            ),
                                                textAlign: TextAlign.center
                                            ),
                                          ],
                                        ),

                                      ],
                                    ))
                                   ],
                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 ),


                                GestureDetector(
                                  onTap: (){
                                    Navigator.of(context).pushNamed(Change_profile_screen.scid);
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: height/30),
                                    height: height/12,
                                    width: width,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black26,width: 1),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: const Card(
                                      child: Center(
                                        child: Text("تعديل الملف الشخصى",style: TextStyle(

                                          fontFamily: 'cairo',
                                          fontWeight: FontWeight.w600
                                        ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ),

                  ];
                },
                body: TabBarView(
                  // These are the contents of the tab views, below the tabs.
                  children: [
                   My_post(
                     Posts:  Provider.of<Prov_get_posts>(context,listen: false).posts_list.where((element) => element.userId==Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.id).toList(),
                   ),
                    My_post(
                      Posts: Provider.of<Prov_get_posts>(context,listen: false).Likes_posts(Provider.of<Prov_Shared_Pref>(context,listen:false).teach_prof_data!.data!.profile!.id!.toInt()),
                    ),

                  ]
                ),
              ),
              endDrawer: const Mydrawer(),

            ),
          ),

    );
  }

}