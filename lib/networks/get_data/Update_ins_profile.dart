import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:illuminate/main.dart';
import 'dart:io';

import 'package:illuminate/networks/get_data/get_profie_details.dart';
import 'package:illuminate/networks/get_data/users.dart';

class Prov_Update_Ins_Profile with ChangeNotifier
{
  Future<void> update_ins_profile({required File imgfile,required String id,
    required String phone,required String lang,required String lat,required String college,required String address})
  async {
    print(id);
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'


    };
    var request = http.MultipartRequest('POST', Uri.parse('http://mohamedelbadry.me/illuminate/api/profile/update/$id'));



    request.fields.addAll({
      'address': 'المحلة الكبرى (قسم 2),الغربية,مصر',
      'longitude': '31.3501843',
      'latitude': '30.9388311',
      'phone': '0199882',
      'college': 'arts',
      '_method': 'PUT'
    });
    request.files.add(await http.MultipartFile.fromPath('image',imgfile.path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    await Get_profile_details().update_profile_det(int.parse(id));
    }
    else {
      print("mm");
      print(response.persistentConnection);
      print(response.reasonPhrase);
    }

notifyListeners();
  }
}