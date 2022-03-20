import 'package:flutter/material.dart';
class Mbutton extends StatelessWidget {
  Mbutton({

required this.width,required this.height,required this.colors,required this.txt,
  required this.wid,required this.func,
  });
  final double ?width;
  final double?height;
  final List<Color>? colors;
  final String? txt;
  final Widget? wid;
  final Function?func;


  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () async{
        func!();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width!/40),
          width: width,
          height: height!/17,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors:colors!,

            ),
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: wid,
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(txt!,style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: Colors.white,
                      fontSize: width!/30,
                      fontWeight: FontWeight.bold
                  ),),

                  SizedBox(width: 20,),

                  Container(
                    height: height!/100,
                    width: width!/100,
                    color: Colors.white,
                  ),

                ],
              ),
            ],
          ),

      ),
    );
  }
}
