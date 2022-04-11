
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Prov_profile_page with ChangeNotifier {
  String Username = "";
  String email = "";
  String Password = "";
  String Address = "";
  String Phone = "";
  File ? profimg;
  String Age = "";
  File? imgfile;
  bool showdata=true;
  bool con_showdata=true;
  String errortext="";

  Changeprofiledata(String name,String address,String phone,String age)
  {
    if(name.isNotEmpty){
      Username = name;
    }
    if(address.isNotEmpty)
      {
        Address = address;
      }
    if(phone.isNotEmpty)
    {
      Phone = phone;
    }
    if(imgfile!=null)
    {
      profimg=imgfile;
    }
    if(age.isNotEmpty){
      Age=age;
    }
    notifyListeners();
  }
  changeuser(String user)
  {
    Username = user;
    notifyListeners();
  }

  Pickimagefromsource(ImageSource source) async
  {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    imgfile=File(pickedFile!.path);
    notifyListeners();

  }

  void changeshow(bool data)
  {
    showdata=!data;
    notifyListeners();
  }
  void con_changeshow(bool data)
  {
    showdata=!data;
    notifyListeners();
  }

  void checkpassword(String pass1,String pass2)
  {
    if(pass1!=pass2)
      {
        errortext="كلمة المرور غير متطابقه";
      }
    else{
      errortext="";
    }
    notifyListeners();
  }


}
