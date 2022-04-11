import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:illuminate/Screens/student/Listof_instructors.dart';
import 'package:illuminate/Screens/student/Search_Screen.dart';
import 'package:illuminate/providers/Check_connected.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:illuminate/refrence.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);
  static const scid="home_screen";

  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    // TODO: implement initState


  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      key:scaffoldKey ,
      endDrawer: Mydrawer(),
     body: Consumer<Prov_Check_connect>(
       builder:(context,prov,ch)=> FutureBuilder(
         future: prov.check_internet(),
         builder: (context,snapshot)=> prov.net_connected==true?
         Consumer<Login_signup_prov>(builder:(context,prov,ch)=>
             CustomScrollView(
               slivers: [
                 SliverAppBar(
                   snap: false,
                   pinned: true,
                   floating: false,

/* الجزء المتحرك */
                   flexibleSpace: FlexibleSpaceBar(
                     centerTitle: true,

                     background: Container(
                         child:Stack(
                           children: [
                             Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),
                                 color: Colors.orange[100],
                               ),
                               height: height/1.9,

                               child: Column(
                                 children: [
                                   Container(
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [

                                         Container(
                                           margin: EdgeInsets.only(top: height/10),
                                           height: height/3,
                                           width: width*2.2/4,
                                           decoration: BoxDecoration(
                                             image: DecorationImage(
                                               image: AssetImage('assets/img/stu_home_back.png'),
                                               fit: BoxFit.fill,

                                             ),
                                           ),
                                         ),
                                         Container(
                                           height: height/3,
                                           width: width/4,
                                           decoration: BoxDecoration(
                                           ),
                                         ),

                                       ],
                                     ),
                                   ),
                                 ],
                               ),
                             ),

/*الجزء المكتوب فيه ابد التعلم*/
                             Positioned(
                               top: height/2.1,
                               right: width/18,
                               left: width/18,
                               child: Card(
                                 elevation: 1,
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(10),
                                 ),
                                 child: Container(
                                   height: height/10,
                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color: Colors.white,
                                   ),
                                   child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children: [

                                       Container(
                                         alignment: Alignment.centerRight,
                                         height: height/10.5,
                                         width: width/7,
                                         decoration: BoxDecoration(
                                           image: DecorationImage(
                                               image: AssetImage('assets/img/stu2.png'),
                                               fit: BoxFit.fill
                                           ),
                                         ),
                                       ),
                                       Container(
                                           margin: EdgeInsets.symmetric(horizontal: width/50),
                                           alignment: Alignment.centerRight,
                                           height: height/11,
                                           width: width/2,
                                           child: Stack(
                                             children: [
                                               Text("ابدأ التعلم ، اختار مُعلمك",style: TextStyle(
                                                 fontSize: height/45,
                                                 fontWeight: FontWeight.bold,
                                                 color: Color.fromRGBO(220, 75, 76, 1),

                                               ),),
                                               Text("ابدأ التعلم ، اختار مُعلمك",style: TextStyle(
                                                 fontSize: height/45,

                                               ),),

                                             ],
                                           )
                                       ),

                                     ],
                                   ),
                                 ),
                               ),

                             ),
/*-------------------------------------------------*/
//جملة الترحيب
                             Positioned(
                               top: height/4.5,
                               right: width/18,
                               left: width/18,
                               child: Consumer<Login_signup_prov>(
                                   builder: (context,prov,ch)=> Column(
                                     crossAxisAlignment: CrossAxisAlignment.end,
                                     children: [
                                       Text("مرحبا,",textDirection: TextDirection.rtl,
                                         style: TextStyle(
                                           fontSize: height/25,
                                           fontWeight: FontWeight.bold,
                                         ),


                                       ),
                                       Text("${prov.suname}",textDirection: TextDirection.rtl,
                                         style: TextStyle(
                                           fontSize: height/30,
                                           fontWeight: FontWeight.bold,
                                         ),


                                       )
                                     ],)
                               ),

                             ),
/*---------------------------------------------------------*/

//الجزء الاحمر المكتوب عليه قايمة المعلمين
                             Positioned(
                               top: height/1.80,
                               left: width/6,

                               child: GestureDetector(
                                 onTap: (){
                                   Navigator.of(context).pushNamed(Instructor_list.scid);
                                 },
                                 child: Card(
                                   elevation: 3,
                                   shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                                   ),
                                   child: Container(
                                     alignment: Alignment.center,
                                     decoration: BoxDecoration(
                                       color:Color.fromRGBO(220, 75, 76, 1),
                                       borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15) ),
                                     ),
                                     height: height/28,
                                     width: width/3,
                                     child: RichText(
                                       text: TextSpan(
                                         children: [
                                           TextSpan(text:"قائمة المُعلمين ",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                               fontSize: height/70,
                                               color: Colors.white,
                                               fontFamily: "cairo"
                                           ),),
                                           WidgetSpan(
                                             child: Icon(Icons.arrow_forward, size: height/65,color: Colors.white,),
                                           ),
                                         ],
                                       ),
                                     ),

                                   ),
                                 ),
                               ),

                             ),
/*-----------------------------*/
/*جزء البحث*/
                             Positioned(
                               top: height/2.6,
                               right: width/18,
                               left: width/18,


                               child: Card(
                                 shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadius.circular(10)
                                 ),
                                 child: Container(
                                   height: 50,
                                   width: double.infinity,
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(10),
                                     color: Colors.white,
                                   ),
                                   child: TextField(
                                     textAlignVertical: TextAlignVertical.top,
                                     textAlign: TextAlign.right,
                                     decoration: InputDecoration(
                                       icon:IconButton(
                                         icon: Icon(Icons.search),
                                         onPressed: (){
                                           Navigator.of(context).pushNamed(Search_screen.scid);

                                         },
                                         iconSize: width/15,
                                       ),
                                       hintText: 'أدخل عنوان البحث',

                                       border: InputBorder.none,
                                       contentPadding: EdgeInsets.only(
                                         right: width/50,

                                       ),
                                     ),
                                     onChanged: (val) {
                                       setState(() {

                                       });
                                     },
                                   ),
                                 ),
                               ),
                             ),
/*------------------------------------------*/

                           ],
                         )
                     ),
                   ), //FlexibleSpaceBar
                   expandedHeight: height/1.8,
                   backgroundColor:  Colors.white,

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

/*الجزء الثابت*/

                 SliverList(
                   delegate: SliverChildBuilderDelegate(
                         (context, index) => index==0?
                     Container(child: Text("أقرب المعلمين:",textDirection: TextDirection.rtl,)):
                     Container(
                       height: height/12,
                       child: ListTile(
                         leading: CircleAvatar(
                           backgroundImage: (index % 2 == 0) ? AssetImage('assets/img/tantawy.jpg') : AssetImage('assets/img/hamama.jpg'),
                         ),
                         tileColor: (index % 2 == 0) ? Color.fromRGBO(255, 255, 255, 1) : Color.fromRGBO(255, 225, 204, 0.2),
                         title: Center(
                           child:  (index % 2 == 0) ?Column(
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               Text("محمود الطنطاوى",textAlign:TextAlign.center,style: TextStyle(
                                   fontSize: height/50,
                                   fontWeight: FontWeight.w500
                               ),),
                               RichText(
                                 text: TextSpan(
                                   children: [
                                     TextSpan(text:"اجا,الدقهليه",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                         fontSize: height/70,
                                         color: Colors.black,
                                         fontFamily: "cairo"
                                     ),),
                                     WidgetSpan(
                                       child: Icon(Icons.location_on_outlined, size: height/65),
                                     ),
                                   ],
                                 ),
                               ),

                             ],
                           ) : Column(
                             children: [
                               Text("محمود حامد",textAlign:TextAlign.center,style: TextStyle(
                                   fontSize: height/50,
                                   fontWeight: FontWeight.w500
                               ),),
                               RichText(
                                 text: TextSpan(
                                   children: [
                                     TextSpan(text:"المحله,غربيه",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                         fontSize: height/70,
                                         color: Colors.black,
                                         fontFamily: "cairo"
                                     ),),
                                     WidgetSpan(
                                       child: Icon(Icons.location_on_outlined, size: height/65),
                                     ),
                                   ],
                                 ),
                               ),


                             ] ,
                           ), //Center
                         ),

                         trailing:
                         GestureDetector(
                           onTap: (){

                           },
                           child: Card(
                             elevation: 3,
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                             ),
                             child: Container(
                               alignment: Alignment.center,
                               decoration: BoxDecoration(
                                 color:Color.fromRGBO(220, 75, 76, 1),
                                 borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15) ),
                               ),
                               height: height/35,
                               width: width/4.5,
                               child: RichText(
                                 text: TextSpan(
                                   children: [
                                     TextSpan(text:"تسجيل مع المعلم",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                         fontSize: height/90,
                                         color: Colors.white,
                                         fontFamily: "cairo"
                                     ),),

                                   ],
                                 ),
                               ),

                             ),
                           ),
                         ),


                       ),
                     ), //ListTile
                     childCount: 51,
                   ),//SliverChildBuildDelegate
                 ) //SliverLi
               ],
             ),
         ):Center(
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

