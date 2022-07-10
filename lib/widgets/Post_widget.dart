import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Instructor/Comments.dart';
import 'package:illuminate/networks/models/all_posts_model.dart';
import 'package:illuminate/networks/models/post_model.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../networks/get_data/get_posts.dart';
import '../providers/Prov_Theme_status.dart';
class post_widget extends StatefulWidget {
  List<post_model> Posts_list;
  post_widget({Key? key, required this.Posts_list}) : super(key: key);


  @override
  State<post_widget> createState() => _post_widgetState();
}

class _post_widgetState extends State<post_widget> {

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return  StreamBuilder(
      stream: Provider.of<Prov_get_posts>(context,listen: false).getposts().asStream(),
      builder:(context,snapshot)=>snapshot.hasData? SizedBox(
          height: height/2.5,
          child: const Center(child: CircularProgressIndicator())): Consumer<Prov_get_posts>(
          builder: (context,prov,ch)=>
          prov.profile_map.length!=0 ?

              Column(children: [

                for(var data in widget.Posts_list)
                  Column(
                    children: [
                      Card(
                        child: Container(
                          height: data.image==null?height/4:height/2,
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
                                                Card(
                                                  shape: const CircleBorder(),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                            image: NetworkImage('http://mohamedelbadry.me/illuminate/${prov.profile_map['${data.userId}']!.data!.profile!.image.toString()}'),
                                                            fit: BoxFit.cover
                                                        )
                                                    ),
                                                    height: height/15,
                                                    width: width/11,
                                                  ),
                                                ),
                                                SizedBox(width: width/20,),
                                                Consumer<Prov_get_posts>(builder:(context,prov,ch)=> AutoSizeText(prov.profile_map['${data.userId}']!.data!.profile!.name.toString(),style: Theme.of(context).textTheme.subtitle1!.copyWith(

                                                    fontSize: width/35
                                                ),),

                                                ),
                                              ],

                                            ),
                                          ),
                                          Container(
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [

                                                Text(data.humanReadableCreatedAt.toString(),style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                    color: const Color.fromRGBO(204, 88, 76, 1),
                                                    fontSize: width/35
                                                ),),

                                              ],
                                            ),
                                          ),
                                          data.userId==Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.id?

                                          DropdownButtonHideUnderline(
                                            child: DropdownButton2(
                                              customButton: Icon(
                                                Icons.share_outlined,
                                                size: width/20,
                                              ),


                                              items: [
                                                DropdownMenuItem(child:GestureDetector(
                                                  onTap: ()async{
                                                    Provider.of<Prov_get_posts>(context,listen: false).delete_post(data.id!.toInt());
                                                  },

                                                  child: ListTile(title: Container(
                                                    child: Text("حذف المنشور",textAlign: TextAlign.right,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                        fontSize: width/35
                                                    ),),
                                                    height: height/10,
                                                    width: width/2.5,
                                                    alignment: Alignment.centerRight,
                                                  ),leading: Icon(Icons.delete)),
                                                ),
                                                  value: "",

                                                ),
                                              ],
                                              onChanged: (value) {

                                              },
                                              dropdownMaxHeight: height/6,
                                              itemHeight: height/18,
                                              itemPadding: EdgeInsets.symmetric(horizontal: width/120,vertical: height/220),
                                              dropdownWidth: width/1.8,

                                              dropdownPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                                              dropdownDecoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(4),
                                                color: Theme.of(context).backgroundColor,
                                              ),
                                              dropdownElevation: 8,

                                            ),
                                          ):Container(),


                                        ],
                                      ),
                                    ),

                                  )

                              ),
                              SizedBox(height: height/300,),
                              Expanded(

                                flex:data.image==null?2:1,
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
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.symmetric(horizontal: width/80),
                                      child: AutoSizeText(
                                        data.body.toString(),
                                        style:  Theme.of(context).textTheme.subtitle1!.copyWith(fontSize: width/20),
                                        textDirection: TextDirection.rtl,
                                        textAlign: TextAlign.end,
                                        maxLines: 3,
                                      ),
                                    )


                                ),


                              ),
                              SizedBox(height: height/300,),
                              Expanded(
                                flex: data.image==null?0:5,
                                child:data.image!=null? Container(


                                  decoration: BoxDecoration(
                                      border: Border.symmetric(
                                          horizontal: BorderSide(
                                              color: Colors.black26,
                                              width: width/680
                                          )
                                      ),
                                      color: Theme.of(context).backgroundColor,
                                      image: DecorationImage(
                                          image:NetworkImage("http://mohamedelbadry.me/illuminate/uploads/post_images/${data.image!.split('/').last}"),
                                          fit: BoxFit.contain
                                      )
                                  ),
                                ):Container(height: 0,),


                              ),
                              SizedBox(height: height/300,),
                              Expanded(
                                flex:1,
                                child: Container(


                                  decoration: BoxDecoration(
                                    color:Theme.of(context).cardColor,
                                    border: Border.symmetric(
                                        horizontal: BorderSide(
                                            color: Colors.black26,
                                            width: width/680
                                        )
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          IconButton(onPressed: (){

                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => commentBox(postid: data.id,)));
                                          }, icon:  Icon(Icons.comment_outlined,size:width/20,),color:Theme.of(context).iconTheme.color,),
                                          SizedBox(width: width/20,),


                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                children: [
                                                  Consumer<Prov_get_posts>(
                                                    builder:(context,prov,ch)=> StreamBuilder(
                                                      stream: prov.getposts().asStream(),
                                                      builder:(context,snapshot)=> IconButton(onPressed: ()async {
                                                        await Provider.of<Prov_get_posts>(context,listen: false).Like_post(data,int.parse(data.id.toString()));

                                                      }, icon: Icon(Icons.favorite_border,size: width/20,),
                                                          color: Provider.of<Prov_get_posts>(context).getlikecolor(data,Provider.of<Prov_Shared_Pref>(context,listen: false).user_data!.user!.id)),
                                                    ),
                                                  ),
                                                  Text(data.likesCount.toString(),style: const TextStyle(
                                                      color: Colors.black45
                                                  ),),
                                                ],
                                              ),
                                              SizedBox(width: width/20,),


                                              DropdownButtonHideUnderline(
                                                child: DropdownButton2(
                                                  customButton: Icon(
                                                    Icons.share_outlined,
                                                    size: width/20,
                                                  ),


                                                  items: [
                                                    DropdownMenuItem(child:GestureDetector(
                                                      onTap: ()async{
                                                        var whatsappUrl ="whatsapp://send?phone=+20${prov.profile_map['${data.userId}']!.data!.profile!.phone}";
                                                        await launchUrl(Uri.parse(whatsappUrl))? launchUrl(Uri.parse(whatsappUrl)):print("");
                                                      },

                                                      child: ListTile(title: Container(
                                                        child: Text("التواصل عن طريق واتساب",textAlign: TextAlign.right,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                            fontSize: width/35
                                                        ),),
                                                        height: height/10,
                                                        width: width/2.5,
                                                        alignment: Alignment.centerRight,
                                                      ),leading: Container(
                                                        alignment: Alignment.centerLeft,
                                                        height: height/10,
                                                        width: width/14,
                                                        decoration: const BoxDecoration(
                                                          image: DecorationImage(
                                                            image: AssetImage("assets/img/whatsapp.png"),
                                                            fit: BoxFit.contain,
                                                          ),
                                                        ),)),
                                                    ),
                                                      value: "",

                                                    ),
                                                    DropdownMenuItem(child:GestureDetector(
                                                        onTap: ()async{
                                                          var whatsappUrl ="mailto:${prov.profile_map['${data.userId}']!.data!.profile!.email}";
                                                          await launchUrl(Uri.parse(whatsappUrl))? launchUrl(Uri.parse(whatsappUrl)):print("");
                                                        },

                                                        child: ListTile(title: Container(
                                                          child: Text("التواصل عن طريق الجيميل",textAlign: TextAlign.right,style: Theme.of(context).textTheme.subtitle1!.copyWith(
                                                              fontSize: width/35
                                                          ),),
                                                          height: height/10,
                                                          width: width/2.5,
                                                          alignment: Alignment.centerRight,
                                                        ),leading: Container(
                                                          alignment: Alignment.centerLeft,
                                                          height: height/10,
                                                          width: width/14,
                                                          decoration: const BoxDecoration(
                                                            image: DecorationImage(
                                                              image: AssetImage("assets/img/gmail.png"),
                                                              fit: BoxFit.contain,
                                                            ),
                                                          ),))),
                                                      value: "",

                                                    ),
                                                  ],
                                                  onChanged: (value) {

                                                  },
                                                  dropdownMaxHeight: height/6,
                                                  itemHeight: height/18,
                                                  itemPadding: EdgeInsets.symmetric(horizontal: width/120,vertical: height/220),
                                                  dropdownWidth: width/1.8,

                                                  dropdownPadding: const EdgeInsets.symmetric(vertical: 0,horizontal: 0),
                                                  dropdownDecoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Theme.of(context).backgroundColor,
                                                  ),
                                                  dropdownElevation: 8,

                                                ),
                                              ),


                                            ],
                                          ),
                                        ],
                                      ),



                                      //SizedBox(width: width/680,child: Container(color: Colors.black26,width: width/680,),),
                                      RichText(
                                        text: TextSpan(
                                          children: [

                                            TextSpan(text:"${prov.profile_map['${data.userId}']!.data!.profile!.address}",style:Theme.of(context).textTheme.subtitle1!.copyWith(
                                                fontSize: width/32,
                                                fontFamily: "cairo"
                                            ),),
                                            WidgetSpan(
                                              child: Icon(Icons.location_on_outlined, size: height/65,color:const Color.fromRGBO(204, 88, 76, 1)),
                                            ),
                                          ],
                                        ),
                                      ),





                                    ],
                                  ),

                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height/140,width: width,)
                    ],
                  ),


              ],):
          Container(
            height: height/3,
            child: Center(
             child:

              CircularProgressIndicator(),/*Container(
               height: height/3,
               width: width/1.25,
               decoration: BoxDecoration(
                 image: DecorationImage(
                   image: AssetImage('assets/img/server_lost.jpg'),
                 )
               ),
             ) ,*/
            ),
          ),



      ),
    );
  }
}
