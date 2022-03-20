
import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
        title: "Title of first page",
        body: "Here you can write the description of the page, to explain someting...",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/forexample.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "Title of first page",
        body: "Here you can write the description of the page, to explain someting...",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/forexample.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
      PageViewModel(
        title: "Title of first page",
        body: "Here you can write the description of the page, to explain someting...",
        image: Center(
          child: Container(
            height:height/1.5 ,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img/forexample.jpg'),
                fit: BoxFit.cover,
              ),

            ),
          ),
        ),
      ),
    ] ;
    return Scaffold(
      body: IntroductionScreen(
        pages: listPagesViewModel,
        next: const Icon(Icons.navigate_next),
        showSkipButton: true,
        skip: const Text("Skip"),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        onDone: () {
          // When done button is press
          Navigator.of(context).pushNamed(Login_Screen.scid);
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
    );


  }

}
