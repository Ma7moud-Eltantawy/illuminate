
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Instructor/add_post.dart';
import 'package:provider/provider.dart';
import '../../networks/get_data/Accept_request.dart';
import '../../networks/get_data/Get_pending_requests.dart';
import '../../networks/get_data/Send_req.dart';
import '../../networks/get_data/get_posts.dart';
import '../../providers/Shared_pref.dart';
import '../../refrence.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';


import '../../widgets/Post_widget.dart';

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
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(Add_post_screen.scid);
              },
              child: Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(

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
                               Consumer<Prov_Shared_Pref>(
                                 builder:(context,pr,ch)=> StreamBuilder(
                                   builder:(context,snapshot)=> CircleAvatar(
                                    backgroundImage: NetworkImage('http://mohamedelbadry.me/illuminate/images/${Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.image.toString().split('/').last}'),

                              ),
                                 ),
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
                                decoration: const BoxDecoration(
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
                                        child: Icon(Icons.location_on, size: height/55,color: const Color.fromRGBO(204, 88, 76, 1),),
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
            ),
            FutureBuilder(
            //future: Provider.of<Prov_Pinding_Requests>(context).getrequests(),
              builder:(context,snapshot)=>snapshot.hasData?
              Center(child:CircularProgressIndicator(),):
              Container(
                alignment: Alignment.center,
                height:Provider.of<Prov_Pinding_Requests>(context).requests_list.length!=0?height/4.2:0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:Provider.of<Prov_Pinding_Requests>(context).requests_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                            child: SizedBox(
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
                                      width: width/2.5,
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
                                                            image: NetworkImage('http://mohamedelbadry.me/illuminate/images/${Provider.of<Prov_Pinding_Requests>(context).requests_list[index].image.toString().split('/').last}'),
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

                                                  Container(
                                                    width:width/3,
                                                    height:height/35,
                                                    child: Text('${Provider.of<Prov_Pinding_Requests>(context).requests_list[index].name}', textAlign: TextAlign.center,
                                                      textDirection: TextDirection.rtl,
                                                      overflow: TextOverflow.ellipsis,

                                                      softWrap: true,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                          fontSize: width/40,
                                                          fontWeight: FontWeight.w300,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [

                                                        Text(
                                                    '${Provider.of<Prov_Pinding_Requests>(context).requests_list[index].address}',
                                                          textDirection: TextDirection.rtl,
                                                          textAlign: TextAlign.center,

                                                          style: TextStyle(fontSize: width/45,fontWeight: FontWeight.w300),
                                                          softWrap: false,
                                                          maxLines: 1,
                                                          overflow: TextOverflow.ellipsis,
                                                        ),
                                                      /*  Container(

                                                          height:height/30,
                                                          child: AutoSizeText('${Provider.of<Prov_Pinding_Requests>(context).requests_list[index].address}', textAlign: TextAlign.right,
                                                            textDirection: TextDirection.rtl,
                                                            minFontSize: width/125,
                                                            maxLines: 4,
                                                            overflow: TextOverflow.ellipsis,
                                                            style: TextStyle(
                                                                fontSize: width/40,


                                                                fontWeight: FontWeight.w300
                                                            ),
                                                          ),
                                                        ),*/
                                                        Container(
                                                            alignment: Alignment.center,
                                                            child: Icon(Icons.location_on_outlined, size: height/65,color: const Color.fromRGBO(220, 75, 76, 1),)),
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
                                          GestureDetector(
                                            child: Card(
                                              elevation: 3,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
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
                                            onTap: ()async{
                                              await Provider.of<Prov_send_req>(context,listen:false ).refuse_request(Provider.of<Prov_Pinding_Requests>(context,listen: false).requests_list[index].id.toString());

                                              await Provider.of<Prov_Pinding_Requests>(context,listen: false).getrequests();
                                            },
                                          ),
                                          GestureDetector(
                                            onTap:()async{
                                              await Provider.of<Prov_accept_req>(context,listen:false ).req_accept(Provider.of<Prov_Pinding_Requests>(context,listen: false).requests_list[index].id.toString());

                                              await Provider.of<Prov_Pinding_Requests>(context,listen: false).getrequests();
                                            } ,
                                            child: Card(
                                              elevation: 3,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(15),topLeft: Radius.circular(15))
                                              ),
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: const BoxDecoration(
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
            ),

            /*البوستات*/

            post_widget(
              Posts_list: Provider.of<Prov_get_posts>(context,listen: false).posts_list,

            ),

          ],
        ),
      ),
    );
  }
}
