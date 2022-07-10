import 'package:flutter/material.dart';
class App_info extends StatelessWidget {
  static const scid="app_info";
  const App_info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),

      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/img/logo.png',height: height/15,),
              Text("ILLUMINATE",style: TextStyle(
                  fontSize: height/20,
                  fontWeight: FontWeight.w900,
                  color: const Color.fromRGBO(204, 88, 76, 1)
              ),)
            ],
          ),
          Container(
            height: height/4,
            width: width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/img/grad.jpg",
                ),
                fit: BoxFit.contain,
              )
            ),

          ),
          SizedBox(
            height: height/7,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30),
                    child: const Text("هذا التطبيق يهدف الى: ",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- توصيل الأٌميين بمدرسين لمساعدتهم فى التعلم ",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- مساعدة طلاب الجامعات على توفير عدد من الطلاب لتعليمهم للتمكن من التخرج",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),

              ],
            ),
          ),
          SizedBox(height: height/20,),
          SizedBox(
            height: height/5,
            width: width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [

                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/30),
                    child: const Text("تنفيذ: ",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- محمود مصطفى احمد الطنطاوى ",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- محمود محمد حامد صميده",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- محمود محمد محمد يوسف غانم",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- ضحى محسن",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: width/10),
                    child: const Text("- عايده سامح",textAlign: TextAlign.start,textDirection: TextDirection.rtl,)),

              ],
            ),
          )

        ],
      ),
    );
  }
}
