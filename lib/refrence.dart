
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/widgets/Profile_Page.dart';
import 'package:illuminate/widgets/settings_screen.dart';
import 'package:provider/provider.dart';

List<Map<String,dynamic>> drawerlist=[
  {
    'title': "تعديل الملف الشخصى",
    'icon':  Icons.person_outlined,
    'func': (BuildContext con) {
      Navigator.of(con).pushNamed(Profile_data_Screen.scid);
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
    'func': () {},
  },
  {
    'title':"تسجيل الخروج",
    'icon': Icons.logout_outlined,
    'func': () {},
  },

];

List<Map<String,dynamic>> Instructorlist=[
  {
    'title':'محمود الطنطاوى',
    'img': AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
  {
    'title':'محمود الطنطاوى',
    'img': AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
  {
    'title':'محمود الطنطاوى',
    'img': AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
  {
    'title':'محمود الطنطاوى',
    'img': AssetImage('assets/img/tantawy.jpg'),
    'age':'22',
    'address': 'اجا , دقهليه',
  },
  {
    'title': 'محمود حامد',

    'img': AssetImage('assets/img/hamama.jpg'),
    'age': '22',
    'address': 'المحله , غربيه',
  },
];





