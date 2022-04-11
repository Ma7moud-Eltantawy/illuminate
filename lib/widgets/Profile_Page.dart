import 'package:flutter/material.dart';
import 'package:illuminate/widgets/Change_Profile_screen.dart';
import 'package:provider/provider.dart';

import '../providers/Prov_profile.dart';
class Profile_data_Screen extends StatefulWidget {
  static const scid="Profile_data";
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
          backgroundColor: Color.fromRGBO(204, 88, 76, 1),
          elevation: 0,
        ),
        body: Column(
          children: [
           Stack(
             children: [
               Container(
                 height:height/2.7 ,
                 width: width,
                 color: Colors.white,
               ),
               Container(
               height:height/3.5 ,
               width: width,
               color:  Color.fromRGBO(204, 88, 76, 1),
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
                       Container(
                         height: height/5,
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.center,
                           children: [

                             Card(
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(200),
                               ),
                               child: Consumer<Prov_profile_page>(
                                 builder:(context,prov,ch)=> Container(
                                   height: height/9,
                                   width: width/4,
                                   decoration: prov.profimg==null?BoxDecoration(
                                     shape: BoxShape.circle,
                                     image: DecorationImage(
                                       image: AssetImage("assets/img/default.png"),
                                       fit: BoxFit.cover
                                     )
                                   ):BoxDecoration(
                                 shape: BoxShape.circle,
                                 image: DecorationImage(
                                     image: FileImage(prov.profimg!),
                                   fit: BoxFit.cover
                               )
                                   ),
                                 ),
                               ),
                             ),
                             Container(
                               child: Column(
                                 children: [
                                   Consumer<Prov_profile_page>(
                                     builder:(context,prov,ch)=> Text(prov.Username,
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
                                       fontWeight: FontWeight.w600,
                                       fontStyle: FontStyle.italic,
                                     ),),
                                   ),
                                   Consumer<Prov_profile_page>(
                                     builder:(context,prov,ch)=>Text(prov.email,
                                       textAlign: TextAlign.center,
                                       style: TextStyle(
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
                       Positioned(
                           top:height/180,
                           right:width/50,

                           child: Opacity(
                             opacity: .8,
                             child: Container(
                               decoration: BoxDecoration(
                                   color:  Color.fromRGBO(204, 88, 76, 1),
                                 borderRadius: BorderRadius.circular(15)
                               ),
                               height: height/20,
                               width: width/9,

                               child: IconButton(
                         icon: Icon(Icons.edit,color:  Colors.white,size: width/20,),
                         onPressed: (){
                             Navigator.of(context).pushNamed(Change_profile_screen.scid);
                         },
                       ),
                             ),
                           )),
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
            Expanded(child:  Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                      mylisttile(width: width,txt:pr.Username,icon: Icons.person_outline,)),
                  Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                      mylisttile(width: width,txt:pr.Phone,icon: Icons.phone_outlined,)),
                  Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                      mylisttile(width: width,txt:pr.Age,icon: Icons.date_range_outlined)),
                  Consumer<Prov_profile_page>(builder:(context,pr,ch)=>
                      mylisttile(width: width,txt:pr.Address,icon: Icons.location_on_outlined,)),
                ],
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
  mylisttile({
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
            fontSize: width/23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      leading: CircleAvatar(
        backgroundColor:  Color.fromRGBO(204, 88, 76, 1),
        child: Icon(
            icon,
            color:   Colors.white
        ),
      ),


    );
  }
}
