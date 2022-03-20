import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Intro.dart';
import 'package:illuminate/Screens/Login.dart';
class Splash_Screen extends StatefulWidget {
  static const scid="Splash";
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> with TickerProviderStateMixin {
 
  AnimationController? _topcontroller,_topandbottomright,_fulllampcontroller,_fullcontroller,_margincont,
      _textcontroller,_rot1con,_rot2con,_rot3con;
  Animation<double> ? _topimg,_topandbottomrightimg,_fulllampimg,_fullimg,_margin,
      _txtanimation,_rot1animation,_rot2animation,_rot3animation;
  double ? mariginheight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _topcontroller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _topimg=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _topcontroller!, curve: Curves.fastOutSlowIn));
    _topimg!.addListener(()=> setState(() {}));
    _topandbottomright=AnimationController(vsync:this,duration: Duration(milliseconds: 1000));
    _topandbottomrightimg=Tween<double>(begin: 0,end: 1).animate((CurvedAnimation(parent: _topandbottomright!,curve: Curves.fastOutSlowIn)));
    _topandbottomrightimg!.addListener(()=>setState(() {}));
    _fulllampcontroller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _fulllampimg=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _fulllampcontroller!, curve: Curves.fastOutSlowIn));
    _fulllampimg!.addListener(()=>setState(() {}));
    _fullcontroller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _fullimg=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _fullcontroller!, curve: Curves.fastOutSlowIn));
    _fullimg!.addListener(()=>setState(() {}));
    _margincont=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _margin=Tween<double>(begin: 50,end: 0).animate(CurvedAnimation(parent: _margincont!, curve: Curves.fastOutSlowIn));
    _margin!.addListener(()=>setState(() {}));
    _textcontroller=AnimationController(vsync: this,duration: Duration(milliseconds: 1000));
    _txtanimation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _textcontroller!, curve: Curves.fastOutSlowIn));
    _txtanimation!.addListener(()=>setState(() {}));
    _rot1con=AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _rot1animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _rot1con!, curve: Curves.fastOutSlowIn));
    _rot1animation!.addListener(()=>setState(() {}));
    _rot2con=AnimationController(vsync: this,duration: Duration(milliseconds: 500));
    _rot2animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _rot2con!, curve: Curves.fastOutSlowIn));
    _rot2animation!.addListener(()=>setState(() {}));
    _rot3con=AnimationController(vsync: this,duration: Duration(milliseconds:500));
    _rot3animation=Tween<double>(begin: 0,end: 1).animate(CurvedAnimation(parent: _rot3con!, curve: Curves.fastOutSlowIn));
    _rot3animation!.addListener(()=>setState(() {}));


    _topcontroller!.forward().then((value){
      _topcontroller!.reverse();
      _topandbottomright!.forward().then((value) {
        _topandbottomright!.reverse();
        _fulllampcontroller!.forward().then((value) {
          _fulllampcontroller!.reverse();
          _fullcontroller!.forward().then((value) {
            _margincont!.forward();
            _textcontroller!.forward().then((value) {
              _rot1con!.forward().then((value) {
                _rot1con!.reverseDuration=Duration(milliseconds: 10);
                _rot1con!.reverse();
                _rot2con!.forward().then((value) {
                  _rot2con!.reverseDuration=Duration(milliseconds: 10);
                  _rot2con!.reverse();
                  _rot3con!.forward().then((value) {
                    _rot3con!.reverseDuration=Duration(milliseconds: 10);
                    _rot3con!.reverse();
                    _rot1con!.forward().then((value) {

                      Future.delayed(Duration(milliseconds: 500),(){
                        Navigator.of(context).pushNamed(Intro_Screen.scid);
                      });
                    });

                  });
                });
              });
            });
          });
        });
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    void Setheigtwidth()
    {
      setState(() {
        mariginheight=height/4;
      });

    }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Opacity(
                opacity: 0.6,
                child: Container(
                  decoration: BoxDecoration(

                    image: DecorationImage(
                      image: AssetImage('assets/img/back.png'),
                      fit: BoxFit.cover
                    )
                  ),

                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/img/topleft.png',height: height/6,),
                        Opacity(
                            opacity:_topimg!.value.toDouble(),
                            child: Image.asset('assets/img/top.png',height: height/6,)),
                        Opacity(
                            opacity:  _topandbottomrightimg!.value.toDouble(),
                            child: Image.asset('assets/img/topandright.png',height: height/6,)),
                        Opacity(
                            opacity:  _fulllampimg!.value.toDouble(),
                            child: Image.asset('assets/img/lampfull.png',height: height/6,)),
                        Opacity(
                            opacity:  _fullimg!.value.toDouble(),
                            child: Image.asset('assets/img/fullimg.png',height: height/6,)),

                      ],

                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: _margin!.value.toDouble()),
                      child: Opacity(
                        opacity: _txtanimation!.value.toDouble(),
                        child: Text("ILLUMINATE",style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Color.fromRGBO(204, 88, 76, 1)
                        ),),
                      ),
                    )
                  ],
                )


              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: _rot1con!.value.toDouble(),
                      child: Center(
                        child: Image.asset('assets/img/image1.png'),
                      ),
                    ),
                    Opacity(
                      opacity: _rot2con!.value.toDouble(),
                      child: Center(
                        child: Image.asset('assets/img/image2.png'),
                      ),
                    ),
                    Opacity(
                      opacity: _rot3con!.value.toDouble(),
                      child: Center(
                        child: Image.asset('assets/img/image3.png'),
                      ),
                    ),
                  ],
                )

              ),
            )

          ],
        ),
      ),
    );
  }
}
