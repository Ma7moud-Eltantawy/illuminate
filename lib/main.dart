

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:illuminate/Screens/Intro.dart';
import 'package:illuminate/Screens/student/Listof_instructors.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/Screens/Splash.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:illuminate/Screens/student/Search_Screen.dart';
import 'package:illuminate/providers/Check_connected.dart';
import 'package:illuminate/providers/Prov_inst_home_page.dart';
import 'package:illuminate/providers/Prov_location.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/widgets/Change_Profile_screen.dart';
import 'package:illuminate/widgets/Profile_Page.dart';
import 'package:illuminate/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import 'Screens/Instructor/instructor_home_screen.dart';
import 'Screens/Instructor/requests_list.dart';
import 'Screens/student/stu_home_screen.dart';
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
        ChangeNotifierProvider.value(value:Prov_instructor_home()),
        ChangeNotifierProvider.value(value:Prov_Check_connect()),
        ChangeNotifierProvider.value(value:Prov_profile_page()),
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
         Instructor_list.scid:(context)=>  Instructor_list(),
         Instrictor_home_screen.scid:(context)=>  Instrictor_home_screen(),
         Req_list.scid:(context)=>  Req_list(),
         Profile_data_Screen.scid:(context)=>  Profile_data_Screen(),
         Change_profile_screen.scid:(context)=>   Change_profile_screen(),
         Search_screen.scid:(context)=> Search_screen(),



       },
        theme: ThemeData(
            fontFamily: 'cairo'
        ),
      ),
    )
  );
}