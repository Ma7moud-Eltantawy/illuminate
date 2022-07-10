
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:http/http.dart' as http;
import 'package:illuminate/networks/models/profile_model.dart';
import 'package:illuminate/providers/Shared_pref.dart';


import '../../main.dart';

class Prov_get_all_profiles with ChangeNotifier
{
  List<all_profile_model> users_list=[];
  List<double> distance=[];
  Map <double,all_profile_model>sortedMap={};
  List<all_profile_model> instructor_orderd=[];
  List<Map<double,String>> userdis=[];

  List<all_profile_model> requests_list=[];


  Future<void> get_ins_profiles() async
  {
    const String url="http://mohamedelbadry.me/illuminate/api/profiles";
    final response=await http.get(Uri.parse(url),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $user_taken'
        });
    print(response.statusCode);

    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body)['data'];
      users_list.clear();
      for(var x in json)
      {
        users_list.add(
            all_profile_model.fromJson(x)
        );
      }
      print(users_list.length);
    }
    else{
      throw Exception("error");
    }

  }

  Future<void> getdistance(var lang, var lat)
  async {
    await get_ins_profiles();
    print("tmam");
    instructor_orderd=[];
    Map<double,all_profile_model> userdis={};
    for(all_profile_model user in users_list) {
      //print(user.profile!.longitude);
      double distanceInMeters = await Geolocator.distanceBetween(
        double.parse(lang.toString()),
        double.parse(lat.toString()),
        double.parse("${user.profile!.latitude}"),
        double.parse("${user.profile!.longitude}"),);


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
      distance.add(key.toDouble());
    }
    print("---------------");
    print(instructor_orderd.map((e) => e.profile!.name));
    print(instructor_orderd[0].profile!.name);
    print("-------------------------------------------");
    await Prov_Shared_Pref().get_stu_prof();

  }



}
