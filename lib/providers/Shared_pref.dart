

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:illuminate/main.dart';
import 'package:illuminate/networks/models/Profile_id_model.dart';
import 'package:illuminate/networks/models/login_model.dart';
import 'package:illuminate/networks/models/stu_model.dart';
import 'package:illuminate/networks/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Prov_Shared_Pref with ChangeNotifier
{
  profile_model ? updatedata;
  String type="";
  profile_model ? teach_prof_data;
  stu_model ? stu_prof_data;
  login_model?user_data;
  var login_json;

  Teacher_prof_db(dynamic jsonuserdata,dynamic jsonprofiledata)async{
    login_json=jsonuserdata;
      final prefs = await SharedPreferences.getInstance();
      await prefs.clear();
      String user = jsonEncode(jsonuserdata);
      prefs.setString('my_user',json.encode(user));
      String profile = jsonEncode(jsonprofiledata);
      prefs.setString('my_prof',json.encode(profile) );
      await get_teach_prof();
      notifyListeners();
    }
    Future<void> get_teach_prof()async{
      stu_prof_data=null;
      final prefs = await SharedPreferences.getInstance();
      var jsonuserdata = jsonDecode(prefs.getString('my_user').toString());
      var user = login_model.fromJson(json.decode(jsonuserdata));
      var jsonprofiledata = jsonDecode(prefs.getString('my_prof').toString());
      var profile = profile_model.fromJson(json.decode(jsonprofiledata));
      print("-------------------------------------");
      teach_prof_data=profile;
      print(user.user!.name);
      user_data =user;
      print(teach_prof_data!.data!.profile!.phone);

      notifyListeners();
  }
  Future<void> test()async{
    final prefs = await SharedPreferences.getInstance();
    var jsonprofiledata = jsonDecode(prefs.getString('my_prof').toString());
    print(jsonprofiledata);
    var profile = profile_model.fromJson(json.decode(jsonprofiledata));
    var jsonuserdata = jsonDecode(prefs.getString('my_user').toString());
    print(jsonuserdata);
    var user = login_model.fromJson(json.decode(jsonuserdata));
    print("-------------------------------------");
    teach_prof_data=profile;
    print(teach_prof_data!.data!.profile!.phone);
    user_data=user;
    user_taken=user.token.toString();
    user_type=user.user!.type;


    notifyListeners();
  }

  Future<void> update_teacher_prof(dynamic jsonprofiledata)async{
    final prefs = await SharedPreferences.getInstance();
    String profile = jsonEncode(jsonprofiledata);
    prefs.setString('my_prof',json.encode(profile) );
    var jsondata = jsonDecode(prefs.getString('my_prof').toString());
    var prof = profile_model.fromJson(json.decode(jsondata));
    updatedata=prof;
    await get_teach_prof();
    notifyListeners();
  }



  /*------------------------------*/



  Future<void> stu_prof_db(dynamic jsonuserdata,dynamic jsonprofiledata)async{
    login_json=jsonuserdata;
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    String user = jsonEncode(jsonuserdata);
    prefs.setString('my_user',json.encode(user));
    String profile = jsonEncode(jsonprofiledata);
    prefs.setString('my_stu_prof',json.encode(profile) );
    await get_stu_prof();
    notifyListeners();
  }
  Future<void> get_stu_prof()async{
    teach_prof_data=null;
    final prefs = await SharedPreferences.getInstance();
    var jsonuserdata = jsonDecode(prefs.getString('my_user').toString());
    var user = login_model.fromJson(json.decode(jsonuserdata));
    var jsonprofiledata = jsonDecode(prefs.getString('my_stu_prof').toString());
    var profile = stu_model.fromJson(json.decode(jsonprofiledata));
    print("-------------------------------------");
    type=user.user!.type.toString();
    stu_prof_data=profile;
    user_data =user;
    user_taken=user.token.toString();
    user_type=user.user!.type;




    print(profile.data!.profile!.image);
    print(user.user!.name);
    print(stu_prof_data!.data!.profile!.longitude.toString());
    print(stu_prof_data!.data!.profile!.name);

    notifyListeners();
  }

  void update_db(dynamic jsonprofiledata)async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('my_prof');
    String profile = jsonEncode(jsonprofiledata);
    prefs.setString('my_prof',json.encode(profile) );
    await get_teach_prof();
    notifyListeners();
  }


  void clear_db()async{
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    notifyListeners();
  }






}
