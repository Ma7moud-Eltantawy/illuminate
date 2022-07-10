
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:illuminate/main.dart';
import 'package:illuminate/networks/get_data/get_profie_details.dart';
import 'package:illuminate/networks/get_data/users.dart';
import 'package:illuminate/providers/Prov_profile.dart';

import '../../providers/Shared_pref.dart';

class Register with ChangeNotifier
{

  final String url="http://mohamedelbadry.me/illuminate/api/register";
  Future<void> create_user({required String name, required String email,required int age,required String type, required String password,required File imgfile,
    required String address,required double lang,required double lat,required String phone,required String college}) async
  {
    //print(name+email+age.toString()+address+phone+lat.toString()+lang.toString());
    final response1=await http.post(Uri.parse(url),body: {
      "name": name,
      "email":email,
      "age": "$age",
      "type": type,
      "password":password,
    });
    print(response1.body);
    try
    {

      user_taken=json.decode(response1.body)['data']['token'].toString();

    }
    catch(e)
    {
      user_taken=null;

    }
    
  if(user_taken!=null)
    {
      if(type=="teacher"){

        var headers = {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${json.decode(response1.body)['data']['token']}'
        };
        var request = http.MultipartRequest('POST', Uri.parse('http://mohamedelbadry.me/illuminate/api/create'));
        request.fields.addAll({
          'address': address,
          'phone': phone,
          'longitude': "$lang",
          'latitude': "$lat",
          'college': college,
        });
        request.files.add(await http.MultipartFile.fromPath('image', imgfile.path));
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();
        print("/////////////////////////////////////////////");
        print(response.headers);
        print(response.statusCode);

        if (response.statusCode == 200) {
          print(await response.stream.bytesToString());
          Prov_profile_page().Changeprofiledata(name, address, phone, age.toString(),college,password.toString());

          //user_taken=json.decode(response1.body)['data']['token'].toString();
          print(response.stream.toString());

          //await Get_profile_details().getusersdata(json.decode(response1.body)['data']['token'].toString(),int.parse(json.decode(response1.body)['data']['user']['id'].toString()),json.decode(response1.body)['data']);




        }
        else {
          print(response.reasonPhrase);
        }}
      else{

        if(type=="student"){
          var headers = {
            'Accept': 'application/json',
            'Authorization': 'Bearer ${json.decode(response1.body)['data']['token'].toString()}'
          };
          var request = http.MultipartRequest('POST', Uri.parse('http://mohamedelbadry.me/illuminate/api/create/student'));
          request.fields.addAll({
            'address': address,
            'phone': phone,
            'longitude': "$lang",
            'latitude': "$lat",
          });
          request.files.add(await http.MultipartFile.fromPath('image', imgfile.path));
          request.headers.addAll(headers);

          http.StreamedResponse response3 = await request.send();
          print("/////////////////////////////////////////////");
          print(response3.headers);
          print(response3.statusCode);

          if (response3.statusCode == 200) {
            print(await response3.stream.bytesToString());

            Prov_profile_page().Changeprofiledata(name, address, phone, age.toString(),college,password.toString());
            user_taken=json.decode(response1.body)['data']['token'].toString();
            print(user_taken);
            await userlogin().Login(email,password);
            //await Get_profile_details().get_stu_profile(json.decode(response1.body)['data']['token'].toString(),int.parse(json.decode(response1.body)['data']['user']['id'].toString()),json.decode(response1.body)['data']);


          }
          else {
            print(response3.reasonPhrase);
          }}
      }
    }


  }


}
