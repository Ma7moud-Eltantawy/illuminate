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
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child:  Consumer<Prov_theme_status>(
          builder:(context,prov,ch)=> CupertinoSwitch(
            value:prov.active_switch ,
            onChanged: (value) {

              prov.changeThemedata(value);
            },
          ),
        ),
      ),
    );
  }
}
