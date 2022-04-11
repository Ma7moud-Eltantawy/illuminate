
import 'package:flutter/material.dart';
import 'dart:io';

class Prov_Check_connect with ChangeNotifier
{
  bool net_connected=true;
  Future <void>check_internet() async
  {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        net_connected=true;

      }
    } on SocketException catch (_) {
     net_connected=false;
    }
    notifyListeners();


  }
}
