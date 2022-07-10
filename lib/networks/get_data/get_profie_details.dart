import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:illuminate/main.dart';
import 'package:illuminate/networks/models/stu_model.dart';
import 'package:illuminate/providers/Shared_pref.dart';
import 'package:provider/provider.dart';

import '../models/Profile_id_model.dart';


class Get_profile_details with ChangeNotifier
{
  String?username;
  String?password;
  String?id;
  String?type;
  profile_model ? profile;
  int idd=0;



  Future<void> getusersdata(String key,int id,var loginresponse) async
  {
    String url="http://mohamedelbadry.me/illuminate/api/profile/details/$id}";

    final response=await http.get(Uri.parse(url),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer $key'
    } );
    print(response.statusCode);
    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body);
      profile=profile_model.fromJson(json);
      print(profile!.data!.profile!.name);

      await Prov_Shared_Pref().Teacher_prof_db(loginresponse,json);
    }

    else{
      throw Exception("error");
    }
  }


  Future<void> get_stu_profile(String key,int id,var loginresponse) async
  {
    String url="http://mohamedelbadry.me/illuminate/api/student/details/$id}";
    final response=await http.get(Uri.parse(url),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer $key'
    } );
    print(response.statusCode);
    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body);
      print("2 ok");


      await Prov_Shared_Pref().stu_prof_db(loginresponse,json);

    }

    else{



      throw Exception("error");
    }
  }



  Future<void> update_profile_det(int uid) async
  {
    String url="http://mohamedelbadry.me/illuminate/api/profile/details/$uid}";
    final response=await http.get(Uri.parse(url),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    } );
    print(response.statusCode);
    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body);
      profile=profile_model.fromJson(json);
      print(profile!.data!.profile!.name);
      await Prov_Shared_Pref().update_teacher_prof(json);
    }

    else{
      throw Exception("error");
    }
    notifyListeners();
  }


  void pluss()
  {
    idd++;
    notifyListeners();
  }
}