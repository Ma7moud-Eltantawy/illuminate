

import 'package:flutter/material.dart';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:illuminate/providers/Prov_profile.dart';

import '../../main.dart';

class Prov_Add_post with ChangeNotifier
{

  Future<void> add_new_post(String id,String postbody,File imgfile) async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://mohamedelbadry.me/illuminate/api/posts'));
    request.fields.addAll({
      
      "body": postbody,

    });
    try{
      request.files.add(await http.MultipartFile.fromPath('image', imgfile.path));
    }
    catch(e){

    }
    //request.files.add(await http.MultipartFile.fromPath('image', imgfile.path));
  request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
  print("/////////////////////////////////////////////");
  print(response.headers);
  print(response.statusCode);

  if (response.statusCode == 200) {
  print(await response.stream.bytesToString());

  }
    else {
      print("mmmmm");
  print(response.reasonPhrase);
  }

  }


}
