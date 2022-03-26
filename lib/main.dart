

import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Intro.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/Screens/Splash.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:illuminate/providers/Prov_location.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import 'Screens/Home_screen.dart';
import 'Screens/map_location.dart';
void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  print(position.longitude);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value:Login_signup_prov()),
        ChangeNotifierProvider.value(value:Prov_loc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       initialRoute: Splash_Screen.scid,
       routes: {
         Splash_Screen.scid:(context)=>Splash_Screen(),
         Login_Screen.scid:(context)=> Login_Screen(),
         Intro_Screen.scid:(context)=>Intro_Screen(),
         Signup_Screen.scid:(context)=>Signup_Screen(),
         Loc_Screen.scid:(context)=>Loc_Screen(),
         Home_screen.scid:(context)=>  Home_screen(),


       },
        theme: ThemeData(
            fontFamily: 'cairo'
        ),
      ),
    )
  );
}