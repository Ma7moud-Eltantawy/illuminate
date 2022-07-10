

import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Instructor/Comments.dart';
import 'package:illuminate/Screens/Intro.dart';
import 'package:illuminate/Screens/more_information.dart';
import 'package:illuminate/Screens/Instructor/profile_Screen.dart';
import 'package:illuminate/Screens/student/Listof_instructors.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/Screens/Splash.dart';
import 'package:illuminate/Screens/signup.dart';
import 'package:illuminate/Screens/student/Search_Screen.dart';
import 'package:illuminate/networks/get_data/Add_post.dart';
import 'package:illuminate/networks/get_data/Register.dart';
import 'package:illuminate/networks/get_data/Update_ins_profile.dart';
import 'package:illuminate/networks/get_data/get_posts.dart';
import 'package:illuminate/networks/get_data/users.dart';
import 'package:illuminate/providers/Check_connected.dart';
import 'package:illuminate/providers/Prov_Theme_status.dart';
import 'package:illuminate/providers/Prov_addpost.dart';
import 'package:illuminate/providers/Prov_inst_home_page.dart';
import 'package:illuminate/providers/Prov_location.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/providers/totrial.dart';
import 'package:illuminate/widgets/App_info.dart';
import 'package:illuminate/widgets/Change_Profile_screen.dart';
import 'package:illuminate/widgets/Profile_Page.dart';
import 'package:illuminate/widgets/settings_screen.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

import 'Screens/Instructor/add_post.dart';
import 'Screens/Instructor/instructor_home_screen.dart';
import 'Screens/Instructor/requests_list.dart';
import 'Screens/student/stu_home_screen.dart';
import 'Screens/map_location.dart';
import 'networks/get_data/Accept_request.dart';
import 'networks/get_data/Get_all_profiles.dart';
import 'networks/get_data/Get_pending_requests.dart';
import 'networks/get_data/Send_req.dart';
import 'networks/get_data/get_profie_details.dart';
var user_type;

String ? user_taken;

void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Geolocator.requestPermission();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value:Login_signup_prov()),
        ChangeNotifierProvider.value(value:Prov_loc()),
        ChangeNotifierProvider.value(value:Prov_instructor_home()),
        ChangeNotifierProvider.value(value:Prov_Check_connect()),
        ChangeNotifierProvider.value(value:Prov_profile_page()),
        ChangeNotifierProvider.value(value:Prov_theme_status()),
        ChangeNotifierProvider.value(value:Prov_add_post()),
        ChangeNotifierProvider.value(value:Prov_get_posts()),
        ChangeNotifierProvider.value(value:userlogin()),
        ChangeNotifierProvider.value(value:Register()),
        ChangeNotifierProvider.value(value:Get_profile_details()),
        ChangeNotifierProvider.value(value:Prov_Add_post()),
        ChangeNotifierProvider.value(value:Prov_Pinding_Requests()),
        ChangeNotifierProvider.value(value:Prov_get_all_profiles()),
        ChangeNotifierProvider.value(value:Prov_Shared_Pref()),
        ChangeNotifierProvider.value(value:Prov_accept_req()),
        ChangeNotifierProvider.value(value:Prov_send_req()),
        ChangeNotifierProvider.value(value:Prov_Update_Ins_Profile()),
        ChangeNotifierProvider.value(value:Prov_tutorial()),
      ],
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
           initialRoute:Splash_Screen.scid,
           routes: {
             Splash_Screen.scid:(context)=>const Splash_Screen(),
             Login_Screen.scid:(context)=> const Login_Screen(),
             Intro_Screen.scid:(context)=>const Intro_Screen(),
             Signup_Screen.scid:(context)=>const Signup_Screen(),
             Home_screen.scid:(context)=>  const Home_screen(),
             Instructor_list.scid:(context)=>  const Instructor_list(),
             Instrictor_home_screen.scid:(context)=>  const Instrictor_home_screen(),
             Req_list.scid:(context)=>  const Req_list(),
             Profile_data_Screen.scid:(context)=>  const Profile_data_Screen(),
             Change_profile_screen.scid:(context)=>   const Change_profile_screen(),
             Search_screen.scid:(context)=> Search_screen(),
             Settings_screen.scid:(context)=>const Settings_screen(),
             Add_post_screen.scid:(context)=>  const Add_post_screen(),
             more_informtion_Screen.scid:(context)=> const more_informtion_Screen(),
             Profile_Screen.scid:(context)=> const Profile_Screen(),
             App_info.scid:(context)=> const App_info(),
           },
            theme: Provider.of<Prov_theme_status>( context ).themeData,
            themeMode:Provider.of<Prov_theme_status>( context ).thmode ,
          );
        }
      ),
    )
  );
}