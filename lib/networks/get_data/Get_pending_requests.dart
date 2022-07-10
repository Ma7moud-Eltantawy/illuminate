
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:illuminate/networks/models/Profile_id_model.dart';

import 'package:http/http.dart' as http;
import 'package:illuminate/networks/models/stu_model.dart';


import '../../main.dart';
import '../models/pending_requests.dart';

class Prov_Pinding_Requests with ChangeNotifier {
  Map<String, stu_model> stu_profile = {};


  List<pending_requests_model> requests_list = [];
  List <stu_model> stu_req_data = [];

  Future<void> getrequests() async
  {
    print("taken" + user_taken!);

    const String url = "http://mohamedelbadry.me/illuminate/api/pendingList";
    final response = await http.get(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $user_taken'
        });

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['data'];
      requests_list.clear();
      stu_req_data.clear();
      print(json);
      for (var x in json) {
        requests_list.add(
            pending_requests_model.fromJson(x)
        );
      }
    }
    else {
      throw Exception("error");
    }
    notifyListeners();
  }




}
