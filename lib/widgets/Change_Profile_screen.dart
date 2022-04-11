import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/widgets/material_button.dart';
import 'package:illuminate/widgets/pass_textfield.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../providers/Prov_login_signup.dart';
import 'Textformfield.dart';
class Change_profile_screen extends StatefulWidget {
  static const scid="change_profile";
  const Change_profile_screen({Key? key}) : super(key: key);

  @override
  State<Change_profile_screen> createState() => _Change_profile_screenState();
}

class _Change_profile_screenState extends State<Change_profile_screen> {
  final  TextEditingController ? _pass=TextEditingController();
  final  TextEditingController ? _confirmpass=TextEditingController();

  final  TextEditingController ? _name=TextEditingController();
  final  TextEditingController ? _phone=TextEditingController();
  final  TextEditingController ? _age=TextEditingController();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  void showsnackbar()
  {
    Navigator.of(context).pop();
    _scaffoldKey.currentState!.showSnackBar(
        new SnackBar(
          duration: Duration(seconds: 2),
            backgroundColor: Color.fromRGBO(204, 88, 76, 1),
            content: Text('تم تعديل كلمة المرور بنجاح',
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
      backgroundColor: Colors.white,
      appBar:AppBar(backgroundColor: Color.fromRGBO(204, 88, 76, 1),
      elevation: 0,

      ) ,
      body: Stack(
        children: [
          Column(
            children: [
              ClipPath(
                clipper:OvalBottomBorderClipper (),
                child: Container(
                  child:Container(
                    width: width,
                    child: Text(
                      "تعديل الملف الشخصى",textAlign: TextAlign.center,style: TextStyle(
                      color: Colors.white,
                      fontSize: width/18
                    ),
                    ),
                  ),
                  height: height/5,
                  color: Color.fromRGBO(204, 88, 76, 1),
                ),
              ),
              SizedBox(height: height/8,),
              Expanded(child: Container(

                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Opacity(
                        opacity: .8,

                        child:
                        txtformfield(controller: _name, width: width, height: height, hinttext: 'تغيير اسم المستخدم',
                          icondata: null,inputtype: TextInputType.name,
                          errortext: null,
                        ),


                      ),
                      SizedBox(height: height/40,),
                      Opacity(
                        opacity: .8,

                        child:
                        txtformfield(controller: _age, width: width, height: height, hinttext: 'تغيير عمر المستخدم',
                          icondata: null,inputtype: TextInputType.number,
                          errortext: null,
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
                      Container(
                        margin: EdgeInsets.symmetric(vertical: height/30),
                        child: Mbutton(width: width, height: height,

                            func: ()async{
                               //Provider.of<Prov_profile_page>(context,listen: false).Changeprofiledata(_name!.text, "", _phone!.text,Provider.of<Prov_profile_page>(context,listen: false).imgfile!.path , _age!.text);
                              Provider.of<Prov_profile_page>(context,listen: false).Changeprofiledata(_name!.text,"",_phone!.text,_age!.text);

                            }
                            ,colors: [
                              Color.fromRGBO(233, 131, 131, 1.0),

                              Color.fromRGBO(236, 104, 104, 1.0),

                              Color.fromRGBO(204, 88, 76, 1),


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
                                          style: TextStyle(
                                              color: Color.fromRGBO(204, 88, 76, 1)
                                          ),
                                          decoration: InputDecoration(
                                            errorText:prov.errortext,
                                            prefixIcon: IconButton(onPressed: () {
                                              prov.changeshow(prov.showdata);
                                            }, icon:prov.showdata==true? Icon(Icons.visibility_off_sharp):Icon(Icons.visibility_sharp),



                                            ),
                                            hintText: 'الرجاء ادخال كلمة المرور',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(204, 88, 76, 1)

                                            ),

                                            errorStyle: TextStyle(

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
                                          style: TextStyle(
                                              color: Color.fromRGBO(204, 88, 76, 1)
                                          ),
                                          decoration: InputDecoration(
                                            errorText: prov.errortext,
                                            prefixIcon: IconButton(onPressed: () {
                                              prov.con_changeshow(prov.con_showdata);
                                            }, icon:prov.con_showdata==true? Icon(Icons.visibility_off_sharp):Icon(Icons.visibility_sharp),



                                            ),
                                            hintText: 'الرجاء ادخال كلمة المرور',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Color.fromRGBO(204, 88, 76, 1)

                                            ),

                                            errorStyle: TextStyle(

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
                                      showsnackbar();
                                    }


                          } ,
                                  child: Text(
                                    "تأكيد كلمة المرور",
                                    style: TextStyle(color: Colors.white, fontSize: width/25,),
                                    textAlign: TextAlign.center,
                                  ),
                                  color:    Color.fromRGBO(204, 88, 76, 1),
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
                  Container(
                    alignment: Alignment.center,
                    height: height/5.1,
                    width: width/2,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                  ),
                  Consumer<Prov_profile_page>(
                    builder:(context,prov,ch)=> Container(
                      alignment: Alignment.center,
                      height: height/5.4,
                      width: width/2.2,
                      decoration:prov.imgfile==null? BoxDecoration(
                        image: DecorationImage(
                          image:AssetImage(
                              "assets/img/tantawy.jpg"
                          ),
                          fit: BoxFit.cover
                        ),
                          color: Colors.white,
                          shape: BoxShape.circle
                      ):BoxDecoration(
                          image: DecorationImage(
                              image:FileImage(
                                  prov.imgfile!
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
                            color: Color.fromRGBO(204, 88, 76, 1),
                            shape: BoxShape.circle
                        ),

                          child: IconButton(onPressed: ()

                          async{
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                                context: context,
                                builder:(context) {
                              return Container(

                                height: height/5,
                                decoration: BoxDecoration(
                                   color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15),
                                  )
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Mbutton(width: width, height: height, colors: [
                                      Color.fromRGBO(59, 199, 221, 1.0),
                                      Color.fromRGBO(59, 199, 221, 1.0),
                                      Color.fromRGBO(52, 138, 199, 1.0),
                                    ],
                                        txt:  "بواسطة الكاميرا", wid: Icon(Icons.camera_alt_outlined,color: Colors.white,size: height/30,), func: ()async{
                                          await Provider.of<Prov_profile_page>(context,listen: false).Pickimagefromsource(ImageSource.camera);
                                        }),
                                    Mbutton(width: width, height: height, colors: [
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
