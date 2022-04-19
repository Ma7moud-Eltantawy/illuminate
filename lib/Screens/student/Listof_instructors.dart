import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:auto_animated/auto_animated.dart';
import '../../refrence.dart';
class Instructor_list extends StatefulWidget {
  static const scid="list_ins";
  const Instructor_list({Key? key}) : super(key: key);


  @override
  State<Instructor_list> createState() => _Instructor_listState();
}

class _Instructor_listState extends State<Instructor_list> {

  // Build animated item (helper for all examples)
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final sc=PageController(initialPage: 0,viewportFraction: 1);
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,

        key: scaffoldKey,
        endDrawer: Mydrawer(),
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
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
                      color: Theme.of(context).backgroundColor
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
                      color: Theme.of(context).backgroundColor
                  ),
                  child: Icon(Icons.menu)),
              tooltip: 'Setting Icon',
              color: Color.fromRGBO(204, 88, 76, 1),
              onPressed:() => scaffoldKey.currentState!.openEndDrawer(),
            ), //Ic

          ], //<Widget>[]
        ),

        body:AnimationLimiter(
          child: ListView.builder(
            controller: sc,

            itemCount: Instructorlist.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(milliseconds: 1000),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Container(
                      height: height/5,

                      child: Stack(
                        children: [

                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius:BorderRadius.circular(10)
                            ),
                            elevation: 5,
                            child: Container(
                              height: height/6,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Theme.of(context).cardColor
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: width/30),
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: height/7.7,
                                          width: width/3.80,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),

                                              color: Colors.orange[100]
                                          ),
                                        ),
                                        Container(
                                          height: height/8,
                                          width: width/4,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              image: DecorationImage(
                                                  image: Instructorlist[index]['img'],
                                                  fit: BoxFit.cover
                                              ),
                                              color: Colors.orange[100]
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: width/35),
                                    height: height/10,
                                    width: width/8,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.people_alt_outlined,color: Color.fromRGBO(204, 88, 76, 1),),
                                        Text("5/10")

                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: width/35),
                                    height: height/8,
                                    width: width/2.5,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('الاسم: ${Instructorlist[index]['title']}', textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontSize: width/32
                                          ),
                                        ),
                                        Text(' العمر: ${Instructorlist[index]['age']}', textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontSize: width/32
                                          ),
                                        ),
                                        Text(' الموقع: ${Instructorlist[index]['address']}', textAlign: TextAlign.right,
                                          textDirection: TextDirection.rtl,
                                          style: TextStyle(
                                              fontSize: width/32
                                          ),
                                        ),

                                      ],
                                    ),
                                  )


                                ],
                              ),

                            ),
                          ),
                          Positioned(
                            bottom:height/120 ,
                              left: width/3,
                              child: GestureDetector(
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
                                    height: height/28,
                                    width: width/3,
                                    child: RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(text:"تسجيل مع المعلم",style:Theme.of(context).textTheme.bodyText1!.copyWith(
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
                              ),),
                        ],
                      ),
                    )
                  ),
                ),
              );
            },
          ),
        ),

      ),
    );
  }
}
