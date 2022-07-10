import 'package:flutter/material.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:provider/provider.dart';

import '../refrence.dart';
class Mydrawer extends StatefulWidget {
  const Mydrawer({Key? key}) : super(key: key);

  @override
  State<Mydrawer> createState() => _MydrawerState();
}

class _MydrawerState extends State<Mydrawer> {
  @override
  Widget build(BuildContext context) {
    var shared=Provider.of<Prov_Shared_Pref>(context);
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: SizedBox(
        width: width/1.3,
        child: ClipRRect(
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
          child: Drawer(
            backgroundColor: Theme.of(context).backgroundColor,

            child: ListView(

              children: [


                SizedBox(
                  height: height/3,

                  child: DrawerHeader(

                    child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: height/5.5,
                              width: width/2,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                      colors: [
                                        Color.fromRGBO(220, 75, 76, 1),
                                        Color.fromRGBO(240, 223, 167, 1),
                                      ]
                                  )
                              ),
                            ),
                            SizedBox(
                              height: height/5.75,
                              width: width/2.25,
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).backgroundColor,
                              ),
                            ),
                            Consumer<Prov_Shared_Pref>(
                              builder:(context,prov,ch)=> Container(
                                height: height/6,
                                width: width/2.5,
                                decoration:shared.stu_prof_data==null? BoxDecoration(
                                  shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage('http://mohamedelbadry.me/illuminate/${shared.teach_prof_data!.data!.profile!.image.toString()}'),
                                        fit: BoxFit.cover
                                    ),
                                    color: Colors.orange[100]
                                ):BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage('http://mohamedelbadry.me/illuminate/${shared.stu_prof_data!.data!.profile!.image.toString()}'),
                                        fit: BoxFit.cover
                                    ),
                                    color: Colors.orange[100]
                                ),
                              ),
                            ),

                          ],)
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                    ),),
                ),
                for(var item in drawerlist)
                  Column(
                    children: [
                      ListTile(
                        title: Text(
                          item['title'],textAlign: TextAlign.right, textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.subtitle1!.copyWith(

                          ),
                        ),
                        leading: Opacity(
                            opacity: .6,
                            child: Icon(item['icon'],color: Theme.of(context).textTheme.subtitle1!.color,)),
                        onTap: (){
                          item['func'](context);
                        },
                      ),
                      Container(
                        height: height/1000,
                        width: double.infinity,
                        decoration: const BoxDecoration(
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
      ),
    );
  }
}
