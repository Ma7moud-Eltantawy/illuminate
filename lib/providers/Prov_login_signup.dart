import 'package:flutter/cupertino.dart';

class Login_signup_prov with ChangeNotifier{
  String usertype="";
  void changeusertype(String type)
  {
    usertype=type;
    notifyListeners();
  }
   bool showdata=true;
  void changeshow(bool data)
  {
    showdata=!data;
    notifyListeners();
  }

}