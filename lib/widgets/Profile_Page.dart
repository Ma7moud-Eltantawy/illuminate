import 'package:flutter/material.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/Change_Profile_screen.dart';
import 'package:provider/provider.dart';

import '../providers/Prov_profile.dart';
class Profile_data_Screen extends StatefulWidget {
  static const scid="stu_Profile_data";
  const Profile_data_Screen({Key? key}) : super(key: key);

  @override
  State<Profile_data_Screen> createState() => _Profile_data_ScreenState();
}

class _Profile_data_ScreenState extends State<Profile_data_Screen> {
  @override
  Widget build(BuildContext context) {
   var pro= Provider.of<Prov_profile_page>(context,listen: false);

   List< Map<String,dynamic>> Profilelist=[
     {
      'username':pro.Username,
      'icon':Icons.person_outline
     },
     {
       'username':pro.Phone,
       'icon':Icons.phone_outlined
     },
     {
       'username':pro.Age,
       'icon':Icons.date_range_outlined
     },
     {
       'username':pro.Address,
       'icon':Icons.location_on_outlined
     },
     

     ];
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).unselectedWidgetColor,
          elevation: 0,
        ),
        body: Column(
          children: [
           Stack(
             children: [
               Container(
                 height:height/2.7 ,
                 width: width,
                 color: Theme.of(context).backgroundColor
               ),
               Container(
               height:height/3.5 ,
               width: width,
               color:  Theme.of(context).unselectedWidgetColor,
             ),
               Positioned(
                 left:width/30 ,
                 right: width/30,
                 bottom: 0,
                 child: Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(12),
                   ),
                   elevation: 3,
                   child: Stack(
                     alignment: Alignment.center,
                     children: [
                       SizedBox(
                         height: height/5,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [

                             Card(
                               shape: const CircleBorder(),
                               child: Consumer<Prov_Shared_Pref>(
                                 builder:(context,prov,ch)=> Container(
                                   height: height/9,
                                   width: width/4,
                                   decoration: prov.stu_prof_data==null?const BoxDecoration(
                                     shape: BoxShape.circle,
                                     image: DecorationImage(
                                       image: AssetImage("assets/img/default.png"),
                                       fit: BoxFit.cover
                                     )
                                   ):BoxDecoration(
                                     border: Border.all(color: Theme.of(context).unselectedWidgetColor),
                                 shape: BoxShape.circle,
                                 image: DecorationImage(
                                     image: NetworkImage('http://mohamedelbadry.me/illuminate/images/${Provider.of<Prov_Shared_Pref>(context,listen: false).stu_prof_data!.data!.profile!.image!.split('/').last}'),
                                   fit: BoxFit.cover
                               )
                                   ),
                                 ),
                               ),
                             ),
                             Container(
                               child: Column(
                                 children: [
                                   Consumer<Prov_Shared_Pref>(
                                     builder:(context,prov,ch)=> Text(prov.stu_prof_data!.data!.profile!.name!.toString(),
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                         color:  Theme.of(context).textTheme.subtitle1!.color,
                                       fontWeight: FontWeight.w600,
                                       fontStyle: FontStyle.italic,
                                     ),),
                                   ),
                                   Consumer<Prov_Shared_Pref>(
                                     builder:(context,prov,ch)=>Text(prov.stu_prof_data!.data!.profile!.email!.toString(),
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                           color:  Theme.of(context).textTheme.subtitle1!.color,
                                         fontWeight: FontWeight.w600,
                                         fontStyle: FontStyle.italic
                                     ),),
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
                   left:width/40 ,
                   right: width/40,
                   top: height/20,
                   child: Text("المعلومات الشخصيه",textAlign: TextAlign.center,style: TextStyle(
                       color: Colors.white,
                       fontSize: height/40,


                   ),)

               ),

             ],
           ),
            Expanded(child:  Consumer<Prov_Shared_Pref>(
              builder:(context,prov,ch)=> Container(

                color: Theme.of(context).backgroundColor,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                        mylisttile(width: width,txt:prov.user_data!.user!.type!.toString(),icon: Icons.person_outline,)),
                    Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                        mylisttile(width: width,txt:prov.stu_prof_data!.data!.profile!.phone==null?"لا يوجد معلومات":prov.stu_prof_data!.data!.profile!.phone.toString(),icon: Icons.phone_outlined,)),
                    Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                        mylisttile(width: width,txt:prov.stu_prof_data!.data!.profile!.age!.toString(),icon: Icons.date_range_outlined)),
                    Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                        mylisttile(width: width,txt:prov.stu_prof_data!.data!.profile!.address!.toString(),icon: Icons.location_on_outlined,)),
                  ],
                  ),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}

class mylisttile extends StatelessWidget {
  const mylisttile({
    required this.width,
    required this.txt,
    required this.icon,
});




  final double width;
  final String txt;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Consumer<Prov_profile_page>(
        builder:(context,prov,ch)=> Text(txt ,textAlign: TextAlign.center,
          style: TextStyle(
            color:  Theme.of(context).textTheme.subtitle1!.color,
            fontSize: width/23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      leading: CircleAvatar(
        backgroundColor:  Theme.of(context).unselectedWidgetColor,
        child: Icon(
            icon,
            color:   Colors.white
        ),
      ),


    );
  }
}
