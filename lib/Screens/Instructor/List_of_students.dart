import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:illuminate/networks/get_data/Accept_request.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


import '../../refrence.dart';
class Stu_List_Screen extends StatefulWidget {
  const Stu_List_Screen({Key? key}) : super(key: key);

  @override
  State<Stu_List_Screen> createState() => _Stu_List_ScreenState();
}

class _Stu_List_ScreenState extends State<Stu_List_Screen> {
  final sc=PageController(initialPage: 0,viewportFraction: 1);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: AnimationLimiter(
        child: Consumer<Prov_accept_req>(
          builder:(context,prov,ch)=> StreamBuilder(
            stream: Provider.of<Prov_accept_req>(context).Acceptation_stu().asStream(),
            builder:(context,snapshot)=>snapshot.hasData?Center(child: CircularProgressIndicator(),):Provider.of<Prov_accept_req>(context,listen: false).acceptation_list.isEmpty? Center(child: CircularProgressIndicator()): ListView.builder(
              itemCount: prov.acceptation_list.length,
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
                                color:Theme.of(context).cardColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius:BorderRadius.circular(10)
                                ),
                                elevation: 5,
                                child: Container(
                                  height: height/5,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Theme.of(context).cardColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerRight,
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
                                                      image: NetworkImage('http://mohamedelbadry.me/illuminate/${prov.acceptation_list[index].image}'),
                                                      fit: BoxFit.cover
                                                  ),
                                                  color: Colors.orange[100]
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2(
                                          customButton:  Column(
                                            mainAxisAlignment: MainAxisAlignment.center,

                                            children: [
                                              Text("تواصل معه:",textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(
                                                fontSize: width/45,
                                                color: Theme.of(context).unselectedWidgetColor,
                                              ),),
                                              IconButton(onPressed: (){}, icon: Container(child: Image.asset('assets/img/contactus.png'),)),

                                            ],
                                          ),



                                          items: [
                                            DropdownMenuItem(child:GestureDetector(
                                              onTap: ()async{
                                                var whatsappUrl ="whatsapp://send?phone=+20${Provider.of<Prov_accept_req>(context,listen: false).acceptation_list[index].phone}";
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
                                                  var whatsappUrl ="mailto:${Provider.of<Prov_accept_req>(context,listen: false).acceptation_list[index].email}";
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


                                      Expanded(
                                        child: Container(
                                          margin:EdgeInsets.symmetric(horizontal: width/35),
                                          height: height/6,
                                          width: width/1.8,


                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Text('الاسم: ${prov.acceptation_list[index].name}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),
                                              Text(' العمر: ${prov.acceptation_list[index].age}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                softWrap: true,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),
                                              Text(' العنوان: ${prov.acceptation_list[index].address}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                maxLines: 2,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),
                                              Text('رقم الهاتف: ${prov.acceptation_list[index].phone}', textAlign: TextAlign.right,
                                                textDirection: TextDirection.rtl,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: width/32
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      )


                                    ],
                                  ),

                                ),
                              ),

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
      ),
    );
  }
}
