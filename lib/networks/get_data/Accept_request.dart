
import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:illuminate/main.dart';
import 'package:illuminate/networks/models/pending_requests.dart';

import 'Get_pending_requests.dart';


class Prov_accept_req with ChangeNotifier
{
  List<pending_requests_model> acceptation_list=[];
  Map<String,pending_requests_model> acceptation_map={};

  Future <void>req_accept(String id) async
  {
    var headers = {
      'Authorization': 'Bearer $user_taken'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://mohamedelbadry.me/illuminate/api/accept'));
    request.fields.addAll({
      'user_id': id
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
  Future <void>Acceptation_stu() async
  {

    const String url = "http://mohamedelbadry.me/illuminate/api/acceptedList";
    final response = await http.get(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $user_taken'
        });
    print(response.body);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body)['data'];
      acceptation_list.clear();
      for (var x in json) {
        acceptation_map.putIfAbsent(pending_requests_model.fromJson(x).id.toString(), () =>pending_requests_model.fromJson(x));
      }
      var keys=acceptation_map.keys.toList();
      for(var x in keys)
        {
          acceptation_list.add(acceptation_map['$x']!);
        }
      print(keys);




    }
    else {
      throw Exception("error");
    }
    notifyListeners();

  }
}
