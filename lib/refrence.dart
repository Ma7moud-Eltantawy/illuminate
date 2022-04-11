
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/widgets/Profile_Page.dart';
import 'package:provider/provider.dart';

List<Map<String,dynamic>> drawerlist=[
  {
    'title': Text('تعديل الملف الشخصى', textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,),
    'icon':  Icon(Icons.person_outlined),
    'func': (BuildContext con) {
      Navigator.of(con).pushNamed(Profile_data_Screen.scid);
    },
  },
  {
    'title': Text('الاعدادات', textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,),
    'icon':  Icon(Icons.settings_outlined),
  },
  {
    'title': Text("حول التطبيق",textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
    'icon':  Icon(Icons.info_outlined),
    'func': () {},
  },
  {
    'title':  Text("تسجيل الخروج",textAlign: TextAlign.right,textDirection: TextDirection.rtl,),
    'icon':  Icon(Icons.logout_outlined),
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





