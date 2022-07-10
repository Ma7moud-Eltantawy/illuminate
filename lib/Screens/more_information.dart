import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:illuminate/Screens/student/stu_home_screen.dart';
import 'package:illuminate/main.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../networks/get_data/Register.dart';
import '../networks/get_data/users.dart';
import '../providers/Prov_location.dart';
import '../providers/Prov_login_signup.dart';
import '../providers/Shared_pref.dart';
import '../widgets/Change_Profile_screen.dart';
import '../widgets/Textformfield.dart';
import '../widgets/material_button.dart';
import '../widgets/myalert.dart';
import 'Instructor/instructor_home_screen.dart';
import 'map_location.dart';
class more_informtion_Screen extends StatefulWidget {
  static const scid="more_informtion";
  const more_informtion_Screen({Key? key}) : super(key: key);

  @override
  _more_informtion_ScreenState createState() => _more_informtion_ScreenState();
}

class _more_informtion_ScreenState extends State<more_informtion_Screen> {
  final  TextEditingController ? _phone=TextEditingController();
  final  TextEditingController ? _college=TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pr=Provider.of<Login_signup_prov>(context,listen: false);
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;



    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Container(
                  alignment: Alignment.centerRight,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/img/back.png'),
                        opacity: 0.5,
                        fit:BoxFit.cover
                    ),
                  ),
                  height: height/7,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/logo.png',height: height/15,),
                      Text("ILLUMINATE",style: TextStyle(
                          fontSize: height/20,
                          fontWeight: FontWeight.w900,
                          color: const Color.fromRGBO(204, 88, 76, 1)
                      ),)
                    ],
                  )
              ),
              Container(
                alignment: Alignment.centerRight,
                width: width,
                margin: EdgeInsets.symmetric(horizontal: width/25,vertical: height/60),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: height/3,
                          width: width,
                          child: Card(
                            shape: const CircleBorder(),
                            color: Colors.amber,
                            child: Consumer<Prov_profile_page>(
                              builder:(context,prov,ch)=> Container(
                                decoration: BoxDecoration(
                                  image:prov.imgfile==null?const DecorationImage(
                                      image: AssetImage('assets/img/def_img.png'),
                                      fit: BoxFit.cover
                                  ): DecorationImage(
                                    image: FileImage(prov.imgfile!),
                                    fit: BoxFit.cover
                                  ),
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.orange.withOpacity(.3),width: width/200),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: height/20,
                          right: width/8,
                          child: GestureDetector(
                            onTap: () async
                            {
                              showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder:(context) {
                                    return bot_sheet(height: height, width: width);

                                  });

                            },
                            child: SizedBox(

                            height: height/20,
                            width: width/10,
                            child: Card(
                              shape: const CircleBorder(),
                              color: Theme.of(context).unselectedWidgetColor,
                              child: Container(
                                child: Center(
                                  child: Icon(Icons.add,color: Colors.white,size: width/22,),
                                ),
                                decoration: BoxDecoration(

                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.orange.withOpacity(.3),width: width/200),
                                ),
                              ),
                            ),
                        ),
                          ),),

                      ],
                    ),
                    SizedBox(height: height/30,),
                    const txt(text: "رقم الهاتف",),
                    Opacity(
                      opacity: .8,

                      child: Consumer<Login_signup_prov>(
                        builder:(ctx,prov,ch)=> txtformfield(controller: _phone, width: width, height: height, hinttext: 'الرجاء ادخال قم الهاتف',
                          icondata: Icons.phone,inputtype: TextInputType.phone,
                          errortext: prov.sunamemsg,

                        ),
                      ),

                    ),
                    const txt(text: "معلومات اضافيه (يجب ادخال الكليه اذا كنت مُدرس)",),
                    Opacity(
                      opacity: .8,

                      child: Consumer<Login_signup_prov>(
                        builder:(ctx,pro,ch)=> txtformfield(controller: _college, width: width, height: height, hinttext: 'الرجاء ادخال اى معلومات اضافيه اذا كنت تريد',
                          icondata: null,inputtype: TextInputType.emailAddress,
                          errortext: pro.suemailmsg,

                        ),
                      ),

                    ),

                  ],
                ),
              ),

              SizedBox(height: height/120,),

              /*-----------------------------------------------------------------*/


              Mbutton(width: width, height: height,

                  func: ()async{
                Provider.of<Login_signup_prov>(context,listen: false).morsinformation(_phone!.text, _college!.text);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loc_Screen(submit:  Positioned(
                    top: height/2200,
                    right: width/800,
                    child: GestureDetector(
                      onTap: ()async{


                        var pro=Provider.of<Prov_profile_page>(context,listen: false);
                        var prov=Provider.of<Login_signup_prov>(context,listen: false);
                        var prLoc=Provider.of<Prov_loc>(context,listen: false);

                        pro.Address=  "${Provider.of<Prov_loc>(context,listen: false).address}";
                        String acctype;
                        Provider.of<Prov_loc>(context,listen: false).markers.isEmpty?

                        Alert(
                          context: context,
                          type: AlertType.warning,
                          title: "!انتبه",
                          desc: "..يجب تحديد موقعك",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "تسجيل دخول",
                                style: TextStyle(color: Colors.white, fontSize: width/30),
                              ),
                              onPressed: () {
                                Navigator.of(context).pushNamed(Login_Screen.scid);
                              },
                              color: const Color.fromRGBO(0, 179, 134, 1.0),
                            ),
                            DialogButton(
                              child: Text(
                                "محاوله مره اخرى",
                                style: TextStyle(color: Colors.white, fontSize: width/30),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: const LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show():
                        {
                          print("mmmmmmmmmmmm"),
                          print(user_taken),


                          await Provider.of<Register>(context, listen: false)
                              .create_user(name: prov.suname,
                              email: prov.suemail,
                              age: int.parse(prov.sunage),
                              type: prov.usertype == "learner"
                                  ? "student"
                                  : "teacher",
                              password: prov.supass,
                              imgfile: pro.imgfile!,
                              address: prLoc.address.toString(),
                              lang: prLoc.currentLatLng.longitude,
                              lat: prLoc.currentLatLng.latitude,
                              phone: prov.phone,
                              college: prov.college),
                          if(user_taken != null)
                            {await userlogin().Login(prov.suemail, prov.supass),
                              acctype = prov.usertype == "learner"
                                  ? "student"
                                  : "teacher",
                              print("----$acctype"),

                              acctype == "student" ? await Provider.of<
                                  Prov_Shared_Pref>(context, listen: false)
                                  .get_stu_prof() :
                              await Provider.of<Prov_Shared_Pref>(
                                  context, listen: false).get_teach_prof(),
                              print(acctype),
                              print("tmam"),

                              Provider
                                  .of<Login_signup_prov>(context, listen: false)
                                  .usertype == "learner" ? Navigator.of(context)
                                  .pushNamed(Home_screen.scid) : Navigator.of(
                                  context).pushNamed(
                                  Instrictor_home_screen.scid)
                            },
                          if(user_taken == null)
                            {
                              alertfunc(ctx: context,
                                  height: height,
                                  width: width,
                                  desc: "هذا الحساب موجود بالفعل..",
                                  buttxt2: "تسجيل دخول",
                                  but2: () {
                                    Navigator.of(context).pushNamed(
                                        Signup_Screen.scid);
                                  },
                                  but1: () {
                                    Navigator.of(context).pushNamed(
                                        Login_Screen.scid);
                                  })
                            },

                        };

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



                  }
                  ,colors: const [
                    Color.fromRGBO(59, 199, 221, 1.0),
                    Color.fromRGBO(59, 199, 221, 1.0),
                    Color.fromRGBO(52, 138, 199, 1.0),
                  ], txt: "التالى",
                  wid: Icon(Icons.arrow_forward,color: Colors.white,size: height/30,)
              ),
              SizedBox(height: height/80),

              SizedBox(height: height/320,),
              Container(

                  child:Row(mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text("لبس لديك معلومات اضافيه ؟ ",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.black26,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.w600
                      )
                      ),
                      SizedBox(width: width/35,),
                      GestureDetector(
                        onTap: (){
                          Navigator.of(context).pushNamed(Login_Screen.scid);
                        },
                        child: Text("تخطى",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 14,
                            color:  const Color.fromRGBO(59, 199, 221, 1.0),
                            fontFamily: 'cairo',
                            fontWeight: FontWeight.w600
                        )
                        ),
                      ),
                    ],
                  )
              ),


            ],

          ),
        ),
      ),
    );
  }
}

class txt extends StatelessWidget {
  const txt({
    required this.text
  });
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: Text(text!,style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontSize: 14,
          color: Colors.black38,
          fontFamily: 'cairo',
          fontWeight: FontWeight.w600
      )
      ),
    );
  }
}
