import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../refrence.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/providers/Prov_inst_home_page.dart';

import 'package:provider/provider.dart';

class Ins_Home_Category extends StatefulWidget {
  const Ins_Home_Category({Key? key}) : super(key: key);

  @override
  State<Ins_Home_Category> createState() => _Ins_Home_CategoryState();
}

class _Ins_Home_CategoryState extends State<Ins_Home_Category> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(

                  height: height/7,
                  width: width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width/20,vertical: height/60),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("ماذا يدور فى عقلك !؟",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: height/55,
                                color: Theme.of(context).textTheme.subtitle1!.color,
                                fontFamily: "cairo"
                            ),),
                            SizedBox(width: width/20,),
                            CircleAvatar(
                              backgroundImage: AssetImage('assets/img/tantawy.jpg'),

                            ),
                          ],
                        ),
                      ),

                      Container(
                        height: height/22,
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(
                                  color: Colors.black26,
                                  width: width/220,
                                )
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(


                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text:"ااضافة صوره",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: height/70,
                                        color: Theme.of(context).textTheme.subtitle1!.color,
                                        fontFamily: "cairo"
                                    ),),
                                    WidgetSpan(
                                      child: Icon(Icons.image, size: height/55,color: Colors.green),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height:height/18 ,
                              width: width/220,
                              child: Container(
                                color: Colors.black26,
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                              ),


                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(text:"تحديد الموقع",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                        fontSize: height/70,
                                        color: Theme.of(context).textTheme.subtitle1!.color,
                                        fontFamily: "cairo"
                                    ),),
                                    WidgetSpan(
                                      child: Icon(Icons.location_on, size: height/55,color: Color.fromRGBO(204, 88, 76, 1),),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: height/4.2,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
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
                                    height: height/5,
                                    width: width/3,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Theme.of(context).cardColor,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: width/30),
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Container(
                                                height: height/9.7,
                                                width: width/6.80,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,


                                                    color: Colors.orange[100]
                                                ),
                                              ),
                                              Container(
                                                height: height/10,
                                                width: width/7,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                        image: Instructorlist[index]['img'],
                                                        fit: BoxFit.contain
                                                    ),
                                                    color: Colors.orange[100]
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(bottom: height/60),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('${Instructorlist[index]['title']}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                style: TextStyle(
                                                    fontSize: width/28,
                                                    fontWeight: FontWeight.w300
                                                ),
                                              ),
                                              RichText(
                                                text: TextSpan(
                                                  children: [
                                                    TextSpan(text:"${Instructorlist[index]['address']} ",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                                        fontSize: width/32,
                                                        fontFamily: "cairo"
                                                    ),),
                                                    WidgetSpan(
                                                      child: Icon(Icons.location_on_outlined, size: height/65,color: Color.fromRGBO(220, 75, 76, 1),),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),



                                      ],
                                    ),

                                  ),
                                ),
                                Positioned(
                                  top:height/5.3 ,
                                  left: width/50,
                                  right: width/50,

                                  child: GestureDetector(
                                    onTap: (){

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Card(
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
                                            width: width/8,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(text:"رفض ",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      fontSize: height/70,
                                                      color: Colors.white,
                                                      fontFamily: "cairo"
                                                  ),),
                                                  WidgetSpan(
                                                    child: Icon(Icons.close, size: height/65,color: Colors.white,),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ),
                                        ),
                                        Card(
                                          elevation: 3,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                                          ),
                                          child: Container(
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color:Color.fromRGBO(10, 90, 0, 1),
                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15) ),
                                            ),
                                            height: height/35,
                                            width: width/8,
                                            child: RichText(
                                              text: TextSpan(
                                                children: [
                                                  TextSpan(text:"قبول ",style:Theme.of(context).textTheme.bodyText1!.copyWith(
                                                      fontSize: height/70,
                                                      color: Colors.white,
                                                      fontFamily: "cairo"
                                                  ),),
                                                  WidgetSpan(
                                                    child: Icon(Icons.check, size: height/65,color: Colors.white,),
                                                  ),
                                                ],
                                              ),
                                            ),

                                          ),
                                        ),
                                      ],
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
            Consumer<Prov_instructor_home>(
                builder: (context,prov,ch)=>
                    Column(children: [
                      for(var data in prov.Posts_data)
                        Column(
                          children: [
                            Container(
                              height: data.img==""?height/4:height/2,
                              color: Theme.of(context).backgroundColor,
                              child: Column(
                                children: [
                                  Expanded(
                                      flex:1,
                                      child: Container(

                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            border: Border.symmetric(
                                                horizontal: BorderSide(
                                                    color: Colors.black26,
                                                    width: width/680
                                                )
                                            )
                                        ),

                                        child: Container(
                                          margin: EdgeInsets.symmetric(horizontal: width/35),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          image: DecorationImage(
                                                              image:  AssetImage(
                                                                  data.userimg),
                                                              fit: BoxFit.contain
                                                          )
                                                      ),
                                                      height: height/15,
                                                      width: width/11,
                                                    ),
                                                    SizedBox(width: width/20,),
                                                    Text(data.user.toString()),
                                                  ],

                                                ),
                                              ),
                                              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
                                            ],
                                          ),
                                        ),

                                      )

                                  ),
                                  SizedBox(height: height/300,),
                                  Expanded(
                                    flex:data.img==""?2:1,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Theme.of(context).cardColor,
                                            border: Border.symmetric(
                                                horizontal: BorderSide(
                                                    color: Theme.of(context).cardColor,
                                                    width: width/680
                                                )
                                            )
                                        ),

                                        alignment: Alignment.centerRight,

                                        child:   Container(
                                          margin: EdgeInsets.symmetric(horizontal: width/80),
                                          child: AutoSizeText(
                                            "${ data.Posttext.toString()}",
                                            style: TextStyle(fontSize: 20),
                                            textDirection: TextDirection.rtl,
                                            textAlign: TextAlign.right,
                                            maxLines: 3,
                                          ),
                                        )


                                    ),


                                  ),
                                  SizedBox(height: height/300,),
                                  Expanded(
                                    flex: data.img==""?0:5,
                                    child: Container(


                                      decoration: BoxDecoration(
                                          border: Border.symmetric(
                                              horizontal: BorderSide(
                                                  color: Colors.black26,
                                                  width: width/680
                                              )
                                          ),
                                          color: Theme.of(context).backgroundColor,
                                          image: DecorationImage(
                                              image: data.img!=""?AssetImage("${data.img}"):AssetImage("assets/img/back.png"),
                                              fit: BoxFit.contain
                                          )
                                      ),
                                    ),


                                  ),
                                  SizedBox(height: height/300,),
                                  Expanded(
                                    flex:1,
                                    child: Container(

                                      decoration: BoxDecoration(
                                        color:Theme.of(context).backgroundColor,
                                        border: Border.symmetric(
                                            horizontal: BorderSide(
                                                color: Colors.black26,
                                                width: width/680
                                            )
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(child: Container(color: Theme.of(context).cardColor,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.comment_outlined),color:Theme.of(context).iconTheme.color,),

                                                ],
                                              )

                                          )),
                                          SizedBox(width: width/680,child: Container(color: Colors.black26,width: width/680,),),
                                          Expanded(child: Container(color: Theme.of(context).cardColor,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border),color: Theme.of(context).iconTheme.color,),
                                                  Text(data.likesnum.toString(),style: TextStyle(
                                                      color: Colors.black45
                                                  ),),
                                                ],
                                              )

                                          ),

                                          ),




                                        ],
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: height/140,width: width,)
                          ],
                        ),

                    ],)



            )

          ],
        ),
      ),
    );
  }
}
