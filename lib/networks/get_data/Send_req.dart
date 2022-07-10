
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:illuminate/main.dart';
import 'package:illuminate/networks/models/pending_requests.dart';


class Prov_send_req with ChangeNotifier
{

  Future <void>send_request(String id) async
  {

    const String url = "http://mohamedelbadry.me/illuminate/api/request";
    final response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $user_taken'
        },body: {
          "teacher_id":id,
        });
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);

    }
    else {
      throw Exception("error");
    }
    notifyListeners();

  }

  Future <void>refuse_request(String id) async
  {

    const String url = "http://mohamedelbadry.me/illuminate/api/refused";
    final response = await http.post(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $user_taken'
        },body: {
          "user_id":id,
        });
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(response.body);

    }
    else {
      throw Exception("error");
    }
    notifyListeners();

  }
}
