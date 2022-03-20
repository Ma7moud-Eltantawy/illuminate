import 'package:flutter/material.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../providers/Prov_login_signup.dart';
import '../widgets/material_button.dart';
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
    String ? usermsg="";
    String ? passmsg="";

    void validateuser(String value) {
      if ( value.isEmpty) {
        setState(() {
          usermsg =" you must enter user name";
        });
      }
      else{
        setState(() {
          usermsg='';
        });
      }
    }
    void validatepassword(String value) {
      if ( value.isEmpty) {
        setState(() {
          usermsg =" you must enter user name";
        });
      }
      else{
        setState(() {
          usermsg='';
        });
      }
    }
    return SafeArea(
      child: Scaffold(

        body: SingleChildScrollView(
          child: Column(

            children:[
            Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
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
                      color: Color.fromRGBO(204, 88, 76, 1)
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
                        style: TextStyle(
                          color: Color.fromRGBO(204, 88, 76, 1)
                        ),
                        decoration: InputDecoration(

                          prefixIcon: Icon(Icons.email_outlined),
                          hintText: 'الرجاء ادخال البريد الالكترونى / رقم الهاتف',
                          hintStyle: TextStyle(
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
                            style: TextStyle(
                              color: Color.fromRGBO(204, 88, 76, 1)
                            ),
                            decoration: InputDecoration(
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
                  func: (){},

                  colors: [

                Color.fromRGBO(59, 199, 221, 1.0),
                Color.fromRGBO(59, 199, 221, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0),
              ], txt: "تسجبل الدخول",
                wid: Icon(Icons.arrow_forward,color: Colors.white,size: height/30,)
              ),
              SizedBox(height: height/80,),
              Mbutton(width: width, height: height,
                func: (){},
                colors: [
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
                            color:  Color.fromRGBO(59, 199, 221, 1.0),
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
