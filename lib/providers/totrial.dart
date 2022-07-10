
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class Prov_tutorial with ChangeNotifier
{
  bool check_seen=false;

  void seen() async
  {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('seen',true);
    print("okk seen");
    notifyListeners();
  }
  Future <void>check_show() async
  {
    try {
      final prefs = await SharedPreferences.getInstance();
      check_seen = prefs.getBool('seen')!;


    }

    catch (_) {

    }
    notifyListeners();


  }
}
