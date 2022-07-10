import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:illuminate/providers/Prov_Theme_status.dart';
import 'package:provider/provider.dart';
class Settings_screen extends StatefulWidget {
  static const scid="settings";
  const Settings_screen({Key? key}) : super(key: key);

  @override
  State<Settings_screen> createState() => _Settings_screenState();
}

class _Settings_screenState extends State<Settings_screen> {

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width=size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text("الاعدادات"),
        centerTitle: true,
        titleTextStyle: Theme.of(context).textTheme.subtitle1!.copyWith(
          fontSize: width/20
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading:  Consumer<Prov_theme_status>(
              builder:(context,prov,ch)=> CupertinoSwitch(
                value:prov.active_switch ,
                onChanged: (value) {

                  prov.changeThemedata(value);
                },
              ),
            ),
            title:const Text("الوضع الداكن",textDirection: TextDirection.rtl,textAlign:TextAlign.right,) ,
          ),
        ],
      ),
    );
  }
}
