import 'package:flutter/material.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:illuminate/Screens/student/stu_home_screen.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:provider/provider.dart';

import '../networks/get_data/users.dart';
import '../providers/Prov_login_signup.dart';
import '../widgets/material_button.dart';
import '../widgets/myalert.dart';
import 'Instructor/instructor_home_screen.dart';
class Login_Screen extends StatefulWidget {
  static const scid="Login";
  const Login_Screen({Key? key}) : super(key: key);

  @override
  _Login_ScreenState createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {
  final  TextEditingController ? _user=TextEditingController();
  final  TextEditingController ? _pass=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(

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
              height: height/4,
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
                margin: EdgeInsets.symmetric(horizontal: width/30,vertical: height/60),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("البريد الالكترونى/رقم الهاتف",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.black38,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.w600
                      )
                      ),
                    ),
                    Opacity(
                      opacity: .8,

                      child: TextFormField(
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.right,
                        validator: (val)=>val!.isEmpty?"user cant be blank":null,
                        controller: _user,
                        keyboardType: TextInputType.emailAddress,
                        textAlignVertical: TextAlignVertical.top,
                        obscureText: false,
                        style: const TextStyle(
                          color: Color.fromRGBO(204, 88, 76, 1)
                        ),
                        decoration: InputDecoration(

                          prefixIcon: const Icon(Icons.email_outlined),
                          hintText: 'الرجاء ادخال البريد الالكترونى / رقم الهاتف',
                          hintStyle: const TextStyle(
                              fontSize: 12,
                              color: Color.fromRGBO(204, 88, 76, 1)

                          ),

                          contentPadding: EdgeInsets.only(
                              right: width/60

                          ),
                        ),


                      ),

                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      child: Text("كلمة المرور",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.black38,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.w600
                      )
                      ),
                    ),
                    Opacity(
                      opacity: .8,
                      child: Consumer<Login_signup_prov>(
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
                  ],
                ),
              ),
              GestureDetector(
                onTap: (){


                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text("هل نسيت كلمة المرور ؟",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 14,
                      color: Colors.black38,
                      fontFamily: 'cairo',
                      fontWeight: FontWeight.w600
                  )
                  ),
                ),
              ),
              SizedBox(height: height/50,),

              Mbutton(width: width, height: height,
                  func: ()async{
                    try{


                      if( await Provider.of<userlogin>(context,listen: false).checkuser(_user!.text, _pass!.text).then((value) => value.toString())!="email is invalid")

                        {
                          print(_user!.text);

                          print(Provider.of<userlogin>(context,listen: false).type.toString());

                          await Provider.of<userlogin>(context,listen: false).Login(_user!.text,_pass!.text );
                          String type= Provider.of<userlogin>(context,listen: false).type.toString();
                          print("----$type");


                         type=="student"? await Provider.of<Prov_Shared_Pref>(context,listen: false).get_stu_prof():
                          await Provider.of<Prov_Shared_Pref>(context,listen: false).get_teach_prof();
                         print(type);
                         print("tmam");

                        // print(Provider.of<Prov_Shared_Pref>(context,listen: false).stu_prof_data!.message);
                         // print(Provider.of<Prov_Shared_Pref>(context,listen: false).teach_prof_data!.message);

                          print(Provider.of<userlogin>(context,listen: false).type);
                          type=="teacher"?Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Instrictor_home_screen()),
                                (Route<dynamic> route) => false,
                          ):Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home_screen()),
                                (Route<dynamic> route) => false,
                          );
                        }
                      else{


                        alertfunc(ctx: context, height: height, width: width, desc: "هناك خطأ فى البريد الالكترونى او كلمة المرور..", buttxt2: "انشاء حساب",
                            but2:(){
                          Navigator.pop(context);
                        }, but1: (){
                          Navigator.of(context).pushNamed(Signup_Screen.scid);

                        });
                      }
                    }
                    catch(e)
                    {

                       alertfunc(ctx: context, height: height, width: width, desc: "هناك خطأ فى البريد الالكترونى او كلمة المرور..", buttxt2: "انشاء حساب",
                           but2:(){
                         Navigator.pop(context);
                       }, but1: (){
                         Navigator.of(context).pushNamed(Signup_Screen.scid);
                       });
                    }



                  },

                  colors: const [

                Color.fromRGBO(59, 199, 221, 1.0),
                Color.fromRGBO(59, 199, 221, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0),
              ], txt: "تسجبل الدخول",
                wid: Icon(Icons.arrow_forward,color: Colors.white,size: height/30,)
              ),
              SizedBox(height: height/80,),
              Mbutton(width: width, height: height,
                func: (){},
                colors: const [
                Color.fromRGBO(60, 90, 153, 1),
                Color.fromRGBO(60, 90, 153, 1),
              ], txt: "التسجيل عن طريق فيسبوك",
              wid: Image.asset('assets/img/facebook.jpg',height: height/30,),
              ),
              SizedBox(height: height/50,),
              Container(

                  child:Row(mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text("ليس لديك حساب ؟ ",style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 14,
                          color: Colors.black26,
                          fontFamily: 'cairo',
                          fontWeight: FontWeight.w600
                      )
                      ),
                      SizedBox(width: width/35,),
                      InkWell(
                        onTap: (){
                          Navigator.of(context).pushNamed(Signup_Screen.scid);
                        },
                        child: Text("انشاء حساب",style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
