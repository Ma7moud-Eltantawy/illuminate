
import 'package:flutter/material.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/Screens/Splash.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:illuminate/widgets/App_info.dart';
import 'package:illuminate/widgets/Profile_Page.dart';
import 'package:illuminate/widgets/settings_screen.dart';
import 'package:provider/provider.dart';

import 'Screens/Instructor/profile_Screen.dart';
import 'main.dart';
import 'networks/get_data/users.dart';


List<Map<String,dynamic>> drawerlist=[
  {
    'title': "تعديل الملف الشخصى",
    'icon':  Icons.person_outlined,
    'func': (BuildContext con) {
      print(Provider.of<userlogin>(con,listen: false).type);
     Provider.of<userlogin>(con,listen: false).type=="teacher"|| user_type=='teacher'?
      Navigator.of(con).pushNamed(Profile_Screen.scid):Navigator.of(con).pushNamed(Profile_data_Screen.scid);

    },
  },
  {
    'title':"الاعدادات",
    'icon':Icons.settings_outlined,
    'func':(BuildContext con) {
      Navigator.of(con).pushNamed(Settings_screen.scid);
    },
  },
  {
    'title': "حول التطبيق",
    'icon':  Icons.info_outlined,
    'func': (BuildContext con) {
      Navigator.of(con).pushNamed(App_info.scid);
    },
  },
  {
    'title':"تسجيل الخروج",
    'icon': Icons.logout_outlined,
    'func': (BuildContext con)async {
       Provider.of<Prov_Shared_Pref>(con,listen:false).clear_db();
       Navigator.pushAndRemoveUntil(
         con,
         MaterialPageRoute(builder: (con) => Login_Screen()),
             (Route<dynamic> route) => false,
       );

    },
  },

];
class stu{
  stu({
    required this.name, required this.img, required this.address, required this.phone, required this.age,
});
  String name;
  String img;
  String age;
  String address;
  String phone;

}
List<Map<String,dynamic>> Instructorlist=[
  {
    'title':'محمود الطنطاوى',
    'img': const AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': const AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
  {
    'title':'محمود الطنطاوى',
    'img': const AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': const AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
  {
    'title':'محمود الطنطاوى',
    'img': const AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': const AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
  {
    'title':'محمود الطنطاوى',
    'img': const AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': const AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
];
List<stu> Studentlist=[
  stu(name:"محمود الطنطاوى", img: "assets/img/tantawy.jpg", address: "اجا , دقهليه", phone: "01015876911", age: "22"),
stu(name:"محمود الطنطاوى", img: "assets/img/tantawy.jpg", address: "اجا , دقهليه", phone: "01015876911", age: "22"),
stu(name:"محمود الطنطاوى", img: "assets/img/tantawy.jpg", address: "اجا , دقهليه", phone: "01015876911", age: "22"),
stu(name:"محمود الطنطاوى", img: "assets/img/tantawy.jpg", address: "اجا , دقهليه", phone: "01015876911", age: "22"),
stu(name:"محمود الطنطاوى", img: "assets/img/tantawy.jpg", address: "اجا , دقهليه", phone: "01015876911", age: "22"),
stu(name:"محمود الطنطاوى", img: "assets/img/tantawy.jpg", address: "اجا , دقهليه", phone: "01015876911", age: "22"),

];





