
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Prov_add_post with ChangeNotifier {
  File? imgfile;
  String ? location;
  Pickimagefromsource(ImageSource source) async
  {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    try{
      imgfile=File(pickedFile!.path);

    }
    catch(e)
    {
      imgfile=null;
    }
    notifyListeners();

  }
  void setloc(String loc)
  {
    location=loc;
    notifyListeners();
  }

}
