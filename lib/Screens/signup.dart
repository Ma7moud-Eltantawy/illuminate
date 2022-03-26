import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../providers/Prov_login_signup.dart';
import '../widgets/Textformfield.dart';
import '../widgets/material_button.dart';
import 'map_location.dart';
class Signup_Screen extends StatefulWidget {
  static const scid="signup";
  const Signup_Screen({Key? key}) : super(key: key);

  @override
  _Signup_ScreenState createState() => _Signup_ScreenState();
}

class _Signup_ScreenState extends State<Signup_Screen> {
  final  TextEditingController ? _user=TextEditingController();
  final  TextEditingController ? _name=TextEditingController();
  final  TextEditingController ? _age=TextEditingController();
  final  TextEditingController ? _pass=TextEditingController();
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
                decoration: BoxDecoration(
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
                        color: Color.fromRGBO(204, 88, 76, 1)
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
                    txt(text: "الاسم",),
                    Opacity(
                      opacity: .8,

                      child: Consumer<Login_signup_prov>(
                        builder:(ctx,prov,ch)=> txtformfield(controller: _name, width: width, height: height, hinttext: 'الرجاء ادخال الاسم بالكامل',
                            icondata: null,inputtype: TextInputType.name,
                        errortext: prov.sunamemsg,

                        ),
                      ),

                    ),
                    txt(text: "العمر",),
                    Opacity(
                      opacity: .8,

                      child: Consumer<Login_signup_prov>(
                        builder:(ctx,pro,ch)=> txtformfield(controller: _age, width: width, height: height, hinttext: 'الرجاء ادخال العمر',
                            icondata: null,inputtype: TextInputType.number,
                          errortext: pro.sunagemsg,
                        ),
                      ),

                    ),
                    txt(text: "البريد الالكترونى",),
                    Opacity(
                      opacity: .8,

                      child: Consumer<Login_signup_prov>(
                        builder:(ctx,pro,ch)=> txtformfield(controller: _user, width: width, height: height, hinttext: 'الرجاء ادخال البريد الالكترونى / رقم الهاتف',
                            icondata: Icons.person,inputtype: TextInputType.emailAddress,
                        errortext: pro.suemailmsg,

                        ),
                      ),

                    ),

                    txt(text: "كلمة المرور",),
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
                              errorText: pr.supassmsg,
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
                    SizedBox(height: height/50,),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Consumer<Login_signup_prov>(
                            builder:(context,prov,ch)=> GestureDetector(
                              onTap: (){
                               prov.changeusertype("teacher");
                              },
                              child: Card(
                                child: Container(

                                  color:prov.usertype=="teacher"? Color.fromRGBO(52, 138, 199, 1.0): Color.fromRGBO(59, 199, 221, 1.0),
                                  height: height/20,
                                  width: width/2.75,
                                  child: Center(
                                   child: Text("مُعلم",
                                   style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                     color: Colors.white
                                   ),
                                   )
                                  ),
                                ),

                              ),
                            ),
                          ),
                          Consumer<Login_signup_prov>(

                            builder:(context,prov,ch)=> GestureDetector(
                              onTap: (){

                                    prov.changeusertype("learner");

                              },
                              child: Card(
                                child: Container(
                                  color: Provider.of<Login_signup_prov>(context,listen: false).usertype=="learner"?Color.fromRGBO(52, 138, 199, 1.0): Color.fromRGBO(59, 199, 221, 1.0),
                                  height: height/20,
                                  width: width/2.75,
                                  child: Center(
                                      child: Text("طالب",
                                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                            color: Colors.white
                                        ),
                                      )
                                  ),
                                ),

                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: height/50,),

              /*-----------------------------------------------------------------*/


              Mbutton(width: width, height: height,

                  func: ()async{
                   await pr.validateuser(_name!.text, _age!.text, _user!.text, _pass!.text);
                if(pr.sunamemsg==""&&pr.sunagemsg==""&&pr.suemailmsg==""&&pr.supassmsg=="" && pr.usertype!="")
                  {
                    Navigator.of(context).pushNamed(Loc_Screen.scid);
                  }
                else if(pr.usertype=="")
                  {
                    
                  }

                  }
                  ,colors: [
                Color.fromRGBO(59, 199, 221, 1.0),
                Color.fromRGBO(59, 199, 221, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0),
              ], txt: "تسجبل الدخول",
                  wid: Icon(Icons.arrow_forward,color: Colors.white,size: height/30,)
              ),
              SizedBox(height: height/80,),

              SizedBox(height: height/50,),
              Container(

                  child:Row(mainAxisAlignment: MainAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text("لديك حساب بالفعل ؟ ",style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
                        child: Text("تسجيل دخول",style: Theme.of(context).textTheme.bodyText1!.copyWith(
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

class txt extends StatelessWidget {
txt({
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
