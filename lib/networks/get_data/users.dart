import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:illuminate/networks/get_data/get_profie_details.dart';
import 'package:illuminate/networks/get_data/user_post.dart';
import 'package:illuminate/networks/models/usermodel.dart';
import 'package:illuminate/providers/Prov_profile.dart';
import 'package:illuminate/providers/Shared_pref.dart';

import '../../main.dart';
List<usermodel> users_list=[];
Map <double,usermodel>sortedMap={};
List<usermodel> instructor_orderd=[];
usermodel? userauth;
List<Map<double,String>> userdis=[];
class userlogin with ChangeNotifier{
  String?username;
  String?password;
  var id;
  String?type;

  Future<void> getdistance()
  async {

    instructor_orderd=[];
    Map<double,usermodel> userdis={};
    for(usermodel user in users_list) {
      double distanceInMeters = Geolocator.distanceBetween(
        double.parse("${userauth!.data!.profile!.latitude}"),
        double.parse("${userauth!.data!.profile!.longitude}"),
        double.parse("${user.data!.profile!.latitude}"),
        double.parse("${user.data!.profile!.longitude}"),);

      try {
        if(distanceInMeters >0) {
          userdis.putIfAbsent(distanceInMeters, () => user);
        }
      }
      catch (e) {
        print(e);
      }
    }

    var sortedKeys = userdis.keys.toList()..sort();
    print(sortedMap);
      for (var key in sortedKeys) {
        instructor_orderd.add(userdis[key]!);
      }
      print("---------------");
      print(instructor_orderd.map((e) => e.data!.profile!.name));
      print(instructor_orderd[0].data!.profile!.name);
    print("-------------------------------------------");
  }
  Future<String> checkuser(String user,String pass) async
  {

    final response = await http.post(
        Uri.parse('http://mohamedelbadry.me/illuminate/api/loginStudent'), body: {
      "email": user.toString(),
      "password": pass.toString(),
      "type": "student",
    });
    print(response.body);
    print(json.decode(response.body)['status']);
    if(json.decode(response.body)['status']==1)
    {
      print(json.decode(response.body)['message']);
      return json.decode(response.body)['message'];

    }
    else{
      final response2 = await http.post(
          Uri.parse('http://mohamedelbadry.me/illuminate/api/loginTeacher'), body: {
        "email": user.toString(),
        "password": pass.toString(),
        "type": "teacher",
      });
      print(response2.body);
      print(json.decode(response2.body)['status']);
      if(json.decode(response2.body)['status']==1)
      {
        return json.decode(response2.body)['message'];


      }
      else {
        return"email is invalid";
      }
    }

  }
  Future<void> Login(String user,String pass) async
  {

    final response = await http.post(
        Uri.parse('http://mohamedelbadry.me/illuminate/api/loginStudent'), body: {
      "email": user.toString(),
      "password": pass.toString(),
      "type": "student",
    });
    print(response.body);
    print(json.decode(response.body)['status']);
    if(json.decode(response.body)['status']==1)
      {
        user_taken=json.decode(response.body)['data']['token'].toString();

        username=user;
        password=pass;
        id=json.decode(response.body)['data']['user']['id'].toString();
        type="student";
        print("1 ok");

        await Get_profile_details().get_stu_profile(json.decode(response.body)['data']['token'].toString(),int.parse(id),json.decode(response.body)['data']);



      }
    else{
      final response2 = await http.post(
          Uri.parse('http://mohamedelbadry.me/illuminate/api/loginTeacher'), body: {
        "email": user.toString(),
        "password": pass.toString(),
        "type": "teacher",
      });
      print(response2.body);
      print(json.decode(response2.body)['status']);
      if(json.decode(response2.body)['status']==1)
      {
        user_taken=json.decode(response2.body)['data']['token'].toString();
        username=user;
        password=pass;
        id=json.decode(response2.body)['data']['user']['id'].toString();
        type="teacher";
        await Get_profile_details().getusersdata(json.decode(response2.body)['data']['token'].toString(),int.parse(id),json.decode(response2.body)['data']);


      }
      Prov_profile_page().type=type.toString();

    }
  }
}