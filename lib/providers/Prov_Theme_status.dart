
import 'package:flutter/material.dart';
import 'dart:io';

class Prov_theme_status with ChangeNotifier
{
  bool active_switch=false;
 ThemeData lightthemedata=ThemeData(
   unselectedWidgetColor: Color.fromRGBO(204, 88, 76, 1),
   iconTheme: IconThemeData(
       color: Colors.black45
   ),
   backgroundColor: Colors.white,
   floatingActionButtonTheme: FloatingActionButtonThemeData(
     backgroundColor: Color.fromRGBO(70, 169, 245, 1),
     foregroundColor: Colors.white,
   ),

   appBarTheme: AppBarTheme(
     backgroundColor:Colors.orange[100],
     iconTheme: IconThemeData(
       color: Color.fromRGBO(204, 88, 76, 1),
     ),
   ),
   brightness: Brightness.light,
     fontFamily: 'cairo',
 );



 /***********************************************/




 ThemeData Darkthemedata = ThemeData(

     unselectedWidgetColor: Color.fromRGBO(0, 73, 125, 1),
     iconTheme: IconThemeData(
         color: Colors.white38,
     ),
   textTheme: TextTheme(
     subtitle1: TextStyle(
       color: Colors.white,
       fontFamily: 'cairo'
     ),
   ),
     backgroundColor: const Color.fromRGBO(34, 50, 70, 1),

   cardColor:Color.fromRGBO(21, 30, 43, 1),
     floatingActionButtonTheme: FloatingActionButtonThemeData(
       backgroundColor: Color.fromRGBO(70, 169, 245, 1),
       foregroundColor: Colors.white,
     ),
   bottomNavigationBarTheme:BottomNavigationBarThemeData(
     backgroundColor: Color.fromRGBO(21, 30, 43, 1),
     selectedIconTheme: IconThemeData(
       color: Colors.white,
     ),
     unselectedIconTheme: IconThemeData(
       color: Colors.black45
     ),
   ),
   appBarTheme: AppBarTheme(
     color: Color.fromRGBO(21, 30, 43, 1),
     iconTheme: IconThemeData(
       color: Colors.white,
     ),
   ),
   primaryColor: Color.fromRGBO(21, 30, 43, 1),
   brightness: Brightness.dark,

   accentColor: Colors.white,
   accentIconTheme: IconThemeData(color: Colors.white),
   dividerColor: Color.fromRGBO(21, 30, 43, 1),
     fontFamily: 'cairo'
 );



/**************************************************************/



 ThemeData themeData=ThemeData(
   unselectedWidgetColor: Color.fromRGBO(204, 88, 76, 1),
   iconTheme: IconThemeData(
     color: Colors.black45
   ),
   backgroundColor: Colors.white,
   appBarTheme: AppBarTheme(
     backgroundColor:Colors.orange[100],
     iconTheme: IconThemeData(
       color: Color.fromRGBO(204, 88, 76, 1),
     ),
   ),
   brightness: Brightness.light,
   accentIconTheme: IconThemeData(color: Colors.white),
   fontFamily:'cairo',
   dividerColor: Colors.white54,
 );
 ThemeMode thmode=ThemeMode.light;

 late String themeval;
 changeThemedata(bool active) {
   active_switch=active;
     if (active == false) {
       themeData = lightthemedata;
       thmode=ThemeMode.light;
     } else {
       themeData = Darkthemedata;
       thmode=ThemeMode.dark;
     }
     notifyListeners();
   }

 }

