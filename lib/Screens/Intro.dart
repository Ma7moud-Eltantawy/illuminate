
import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/providers/totrial.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:provider/provider.dart';
class Intro_Screen extends StatefulWidget {
  static const scid="intro";
  const Intro_Screen({Key? key}) : super(key: key);

  @override
  _Intro_ScreenState createState() => _Intro_ScreenState();
}

class _Intro_ScreenState extends State<Intro_Screen> {


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    List <PageViewModel>listPagesViewModel=[
      PageViewModel(
        title: "أهلا وسهلاً",
        body: " (illuminate) مرحبا بك فى تطبيق ",
        image: Center(
          child: Container(
            height:height/1 ,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/toutrial.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "عملية تسجيل الدخول",
        body: "اذا كان لديك حساب بالفعل ، فعليك بإدخال اسم المستخدم وكلمة المرور ثم الضغط على (تسجيل الدخول) ، او انشاء حساب جديد عن طريق الضغط على (انشاء حساب) ",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/tot1.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "إنشاء حساب جديد",
        body: "ادخل المعلومات المطلوبه ثم اضغط على (تسجيل الدخول)",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/tot2.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "اضافة بعض المعلومات",
        body: "يمكنك ادخال بعض المعلومات الاضافيه المطلوبه (الصورة الشخصيه - رقم الهاتف - الجامعه )",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/tot3.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "تحديد موقعك",
        body: "يمكنك تحديد موقعك عن طريق الضغط على (الموقع الحالى) او البحث عن المدينه التى تريديها عن طريق الضغط على مربع البحث ، ثم الضغط على السهم اقصى اليمين للدخول",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/tot4.png'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "الدخول للتطبيق",
        body: "....نتمنى تحقيق مطالبكم",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/tot5.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
    ] ;
    return SafeArea(
      child: Scaffold(
        body: IntroductionScreen(

          pages: listPagesViewModel,
          next: const Icon(Icons.navigate_next),
          showSkipButton: true,
          skip: const Text("تخطى"),
          done: const Text("تم", style: TextStyle(fontWeight: FontWeight.w600)),
          onDone: () async{
             Provider.of<Prov_tutorial>(context,listen: false).seen();
            // When done button is press
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Login_Screen()),
                  (Route<dynamic> route) => false,
            );
          },
          dotsDecorator: DotsDecorator(
              size: const Size.square(10.0),
              activeSize: const Size(20.0, 10.0),
              color: Colors.black26,
              spacing: const EdgeInsets.symmetric(horizontal: 3.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0))
          ),
          baseBtnStyle: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
            ),
          ),
          skipStyle: TextButton.styleFrom(primary: Colors.red),
          doneStyle: TextButton.styleFrom(primary: Colors.greenAccent),

        ) ,
      ),
    );


  }

}
