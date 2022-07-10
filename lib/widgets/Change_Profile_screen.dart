import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:illuminate/main.dart';
import 'package:illuminate/networks/get_data/Update_ins_profile.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/material_button.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Screens/Login.dart';
import '../Screens/map_location.dart';
import '../networks/get_data/Register.dart';
import '../networks/get_data/users.dart';
import '../providers/Prov_location.dart';
import '../providers/Prov_login_signup.dart';
import 'Textformfield.dart';
class Change_profile_screen extends StatefulWidget {
  static const scid="change_profile";
  const Change_profile_screen({Key? key}) : super(key: key);

  @override
  State<Change_profile_screen> createState() => _Change_profile_screenState();
}

class _Change_profile_screenState extends State<Change_profile_screen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final  TextEditingController ? _pass=TextEditingController();
  final  TextEditingController ? _confirmpass=TextEditingController();

  final  TextEditingController ? _college=TextEditingController();
  final  TextEditingController ? _phone=TextEditingController();
  final  TextEditingController ? _age=TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void showsnackbar(String txt,Function func)
  {
   func();
    _scaffoldKey.currentState!.showSnackBar(
        SnackBar(
          duration: const Duration(seconds: 3),
            backgroundColor: Theme.of(context).unselectedWidgetColor,
            content: const Text('تم تعديل الملف الشخصى',
              textAlign: TextAlign.center,
              style: TextStyle(
              color: Colors.white,
                fontFamily: 'cairo'
            ),)
        )
    );

  }




  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar:AppBar(
        iconTheme: Theme.of(context).iconTheme.copyWith(
          color: Colors.white
        ),

        backgroundColor: Theme.of(context).unselectedWidgetColor,
      elevation: 0,

      ) ,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper:OvalBottomBorderClipper (),
                child: Container(
                  child:SizedBox(
                    width: width,
                    child: Text(
                      "تعديل الملف الشخصى",textAlign: TextAlign.center,style: TextStyle(
                      color: Theme.of(context).backgroundColor,
                      fontSize: width/18
                    ),
                    ),
                  ),
                  height: height/5,
                  color: Theme.of(context).unselectedWidgetColor,
                ),
              ),
              SizedBox(height: height/8,),
              Expanded(child: Container(

                color:  Theme.of(context).backgroundColor,
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [


                          SizedBox(height: height/40,),
                          Opacity(
                            opacity: .8,

                            child:
                            Container(
                              width: width,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      child: Consumer<Prov_loc>(
                                        builder:(context,prov,ch)=> Text(

                                          Provider.of<Prov_loc>(context,listen: false).address==null?'':Provider.of<Prov_loc>(context,listen: false).address!.toString(),textDirection: TextDirection.rtl,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                          color: Theme.of(context).unselectedWidgetColor,
                                          ),
                                        softWrap: true,
                                        textAlign: TextAlign.center,),
                                      ),

                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Loc_Screen(submit:  Positioned(
                                            top: height/2200,
                                            right: width/800,
                                            child: GestureDetector(
                                              onTap: (){
                                                 Provider.of<Prov_loc>(context,listen: false).update_loc();
                                                Navigator.of(context).pop();
                                              },
                                              child: Card(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(100.0)),
                                                elevation: 5,

                                                child: const CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  child: Icon(Icons.navigate_next,size: 20,),
                                                ),
                                              ),
                                            ),
                                          ),)),

                                        );
                                      },
                                      child: Card(
                                        child: Container(
                                          child: Text('تغيير العنوان',textDirection: TextDirection.rtl,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Theme.of(context).unselectedWidgetColor,
                                          ),
                                            softWrap: true,
                                            textAlign: TextAlign.center,
                                          ),

                                        ),
                                      ),
                                    ),
                                  ),


                                ],
                              ),
                            ),


                          ),
                          SizedBox(height: height/40,),
                          Opacity(
                            opacity: .8,

                            child:
                            txtformfield(controller: _phone, width: width, height: height, hinttext: 'تغيير رقم الهاتف',
                              icondata: null,inputtype: TextInputType.phone,
                              errortext: null,
                            ),


                          ),
                          SizedBox(height: height/40,),
                          Opacity(
                            opacity: .8,

                            child:
                            txtformfield(controller: _college, width: width, height: height, hinttext: 'تغيير الجامعه(الكُليه)',
                              icondata: null,inputtype: TextInputType.phone,
                              errortext: null,
                            ),


                          ),

                          SizedBox(height: height/40,),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: height/30),
                            child: Mbutton(width: width, height: height,

                                func: ()async{
                                  var pro=Provider.of<Prov_loc>(context,listen: false);
                                  var prov=Provider.of<Prov_Shared_Pref>(context,listen: false);
                              print(Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.image);
                                   //Provider.of<Prov_profile_page>(context,listen: false).Changeprofiledata(_name!.text, "", _phone!.text,Provider.of<Prov_profile_page>(context,listen: false).imgfile!.path , _age!.text);
                                 await Provider.of<Prov_Update_Ins_Profile>(context,listen:false ).update_ins_profile(imgfile:File(Provider.of<Prov_profile_page>(context,listen: false).imgfile!.path),id:Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.profileId!.toString(),

                                   phone:_phone!.text.isEmpty?Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.phone.toString():_phone!.text,lang:pro.newlang==null?prov.teach_prof_data!.data!.profile!.longitude.toString():pro.newlang! ,lat:pro.newlang==null?prov.teach_prof_data!.data!.profile!.latitude.toString():pro.newlang!,
                                     college:_college!.text.isEmpty?Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.college.toString():_college!.text,address:pro.newaddress==null?prov.teach_prof_data!.data!.profile!.address.toString():pro.newaddress.toString(),




                                 );
                                 await Provider.of<Prov_Shared_Pref>(context,listen: false).get_teach_prof();


                                  showsnackbar("تم تغيير الملف الشخصى بنجاح",(){});


                              print(Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.data!.profile!.image);

                                }
                                ,colors: [

                                  Theme.of(context).unselectedWidgetColor.withOpacity(.5),
                                  Theme.of(context).unselectedWidgetColor.withOpacity(.75),
                                  Theme.of(context).unselectedWidgetColor,

                                  Theme.of(context).unselectedWidgetColor,
                                ], txt: "تأكيد التعديل",
                                wid: Icon(Icons.arrow_forward,color: Colors.white,size: height/30,)
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              Alert(
                                  context: context,
                                  title: "تغيير كلمة المرور",
                                  content: Column(
                                    children: <Widget>[
                                      Opacity(
                                        opacity: .8,
                                        child: Consumer<Prov_profile_page>(
                                          builder:(context,prov,ch)=>Center(
                                            child: TextFormField(
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.right,
                                              textAlignVertical: TextAlignVertical.top,
                                              validator: (val)=>val!.isEmpty?"user cant be blank":null,
                                              controller: _pass,

                                              keyboardType: TextInputType.visiblePassword,
                                              obscureText: prov.showdata,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(204, 88, 76, 1)
                                              ),
                                              decoration: InputDecoration(
                                                errorText:prov.errortext,
                                                prefixIcon: IconButton(onPressed: () {
                                                  prov.changeshow(prov.showdata);
                                                }, icon:prov.showdata==true? const Icon(Icons.visibility_off_sharp):const Icon(Icons.visibility_sharp),



                                                ),
                                                hintText: 'الرجاء ادخال كلمة المرور',
                                                hintStyle: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(204, 88, 76, 1)

                                                ),

                                                errorStyle: const TextStyle(

                                                ),

                                                contentPadding: EdgeInsets.only(
                                                    right: width/60

                                                ),
                                              ),



                                            ),
                                          ),
                                        ),

                                      ),
                                      Opacity(
                                        opacity: .8,
                                        child: Consumer<Prov_profile_page>(
                                          builder:(context,prov,ch)=>Center(
                                            child: TextFormField(
                                              textDirection: TextDirection.ltr,
                                              textAlign: TextAlign.right,
                                              textAlignVertical: TextAlignVertical.top,
                                              validator: (val)=>val!.isEmpty?"user cant be blank":null,
                                              controller: _confirmpass,

                                              keyboardType: TextInputType.visiblePassword,
                                              obscureText: prov.con_showdata,
                                              style: const TextStyle(
                                                  color: Color.fromRGBO(204, 88, 76, 1)
                                              ),
                                              decoration: InputDecoration(
                                                errorText: prov.errortext,
                                                prefixIcon: IconButton(onPressed: () {
                                                  prov.con_changeshow(prov.con_showdata);
                                                }, icon:prov.con_showdata==true? const Icon(Icons.visibility_off_sharp):const Icon(Icons.visibility_sharp),



                                                ),
                                                hintText: 'الرجاء ادخال كلمة المرور',
                                                hintStyle: const TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromRGBO(204, 88, 76, 1)

                                                ),

                                                errorStyle: const TextStyle(

                                                ),

                                                contentPadding: EdgeInsets.only(
                                                    right: width/60

                                                ),
                                              ),



                                            ),
                                          ),
                                        ),

                                      ),
                                    ],
                                  ),
                                  buttons: [
                                    DialogButton(
                                      onPressed: () {
                                       Provider.of<Prov_profile_page>(context,listen: false).checkpassword(_pass!.text,_confirmpass!.text);
                                      if( Provider.of<Prov_profile_page>(context,listen: false).errortext=="")
                                        {
                                          showsnackbar("تم تغيير كلمة المرور بنجاح",(){ Navigator.of(context).pop();});
                                        }


                              } ,
                                      child: Text(
                                        "تأكيد كلمة المرور",
                                        style: TextStyle(color: Colors.white, fontSize: width/25,),
                                        textAlign: TextAlign.center,
                                      ),
                                      color:    const Color.fromRGBO(204, 88, 76, 1),
                                    )
                                  ]).show();
                            },
                            child: Text("تغيير كلمة المرور",textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: width/25,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.underline
                            ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )),


            ],
          ),
          Positioned(
            top: height/11,
            left: width/10,
            right: width/10,
            child: Stack(
              alignment: Alignment.center,
              children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Card(
                    shape: const CircleBorder(),
                    child: Container(
                      alignment: Alignment.center,
                      height: height/5.1,
                      width: width/2,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                  Consumer<Prov_Shared_Pref>(
                    builder:(context,prov,ch)=> Container(
                      alignment: Alignment.center,
                      height: height/5.4,
                      width: width/2.2,
                      decoration:
                          Provider.of<Prov_profile_page>(context).imgfile!=null?
                          BoxDecoration(
                              image: DecorationImage(
                                  image:FileImage(
                                    File(Provider.of<Prov_profile_page>(context).imgfile!.path),
                                  ),
                                  fit: BoxFit.cover
                              ),
                              color: Colors.white,
                              shape: BoxShape.circle
                          )
                              :

                      prov.stu_prof_data==null? BoxDecoration(
                        image: DecorationImage(
                          image:NetworkImage(
                              'http://mohamedelbadry.me/illuminate/images/${prov.teach_prof_data!.data!.profile!.image!.split('/').last}'
                          ),
                          fit: BoxFit.cover
                        ),
                          color: Colors.white,
                          shape: BoxShape.circle
                      ):BoxDecoration(
                          image: DecorationImage(
                              image:NetworkImage(
                                  'http://mohamedelbadry.me/illuminate/images/${prov.stu_prof_data!.data!.profile!.image!.split('/').last}'
                              ),
                              fit: BoxFit.cover
                          ),
                          color: Colors.white,
                          shape: BoxShape.circle
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 0,
                    right: width/20,
                    child: Opacity(
                      opacity: .8,
                      child: Container(
                        height: height/12,
                        width: width/12,
                        decoration: BoxDecoration(
                            color: Theme.of(context).unselectedWidgetColor.withOpacity(.7),
                            shape: BoxShape.circle
                        ),

                          child: IconButton(onPressed: ()

                          async{
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                                context: context,
                                builder:(context) {
                              return bot_sheet(height: height, width: width);

                            });

                          },
                              icon: Icon(Icons.edit,size: width/20,),color: Colors.white,),

                      ),
                    ),
                  )
                ],
              )
            ],),
          )
        ],
      ),
    );
  }
}

class bot_sheet extends StatelessWidget {
  const bot_sheet({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(

      height: height/5,
      decoration: BoxDecoration(
         color: Theme.of(context).backgroundColor,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Mbutton(width: width, height: height, colors: const [
            Color.fromRGBO(59, 199, 221, 1.0),
            Color.fromRGBO(59, 199, 221, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0),
          ],
              txt:  "بواسطة الكاميرا", wid: Icon(Icons.camera_alt_outlined,color: Colors.white,size: height/30,), func: ()async{
                await Provider.of<Prov_profile_page>(context,listen: false).Pickimagefromsource(ImageSource.camera);
              }),
          Mbutton(width: width, height: height, colors: const [
            Color.fromRGBO(255, 200,0, 1.0),
            Color.fromRGBO(255, 200,0, 1.0),
            Color.fromRGBO(220, 162, 100, 1.0),
          ],
              txt: "بواسطة الاستوديو", wid:Icon(Icons.collections_outlined,color: Colors.white,size: height/30,) , func: ()async{
                await Provider.of<Prov_profile_page>(context,listen: false).Pickimagefromsource(ImageSource.gallery);
              })
        ],
      ),
    );
  }
}
