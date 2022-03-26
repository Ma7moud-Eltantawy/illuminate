import 'package:flutter/cupertino.dart';

class Login_signup_prov with ChangeNotifier{
  String usertype="";
  String sunamemsg="";
  String sunagemsg="";
  String suemailmsg="";
  String supassmsg="";
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
  Future<void>validateuser(String name,String age,String email,String pass) async
  {
    await su_validatename(name);
    await su_validateage(age);
    su_validatemail(email);
    su_validatepass(pass);
    notifyListeners();
  }
  Future<void>su_validatename(String name) async {
    if(name.isEmpty)
    {
      sunamemsg="يجب ادخال الاسم";
    }
    else{
      sunamemsg="";
    }
    notifyListeners();
  }
  Future<void>su_validateage(String age) async {
    if(age.isEmpty)
    {
      sunagemsg =" يجب ادخال العمر";
    }
    else{
      sunagemsg ="";
    }
    notifyListeners();
  }
  Future<void>su_validatemail(String email) async {
    if(email.isEmpty)
    {
      suemailmsg="يجب ادخال البريد الالكترونى او الهاتف";
    }
    else
      {
        suemailmsg="";
      }
    notifyListeners();
  }
  Future<void>su_validatepass(String pass) async {
    if ( pass.isEmpty) {

      supassmsg="يجب ادخال كلمة المرور";
    }
    else
      {
        supassmsg="";
      }
    notifyListeners();
  }

}