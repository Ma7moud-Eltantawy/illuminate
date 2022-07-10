import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:illuminate/networks/models/user_post_model.dart';
List<user_post_model> users_post_list=[];
List<Map<double,String>> userdis=[];
class user_post_login{
 /* Future<user_post_model> getuserpostsdata() async
  {
    const String url="https://gorest.co.in/public/v2/users?access-token=f3b31af12b5b52ce7075d9e40dd066e227d8a63c1a046c3e728af0528c821dd0";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body);
      users_post_list.clear();
      for(var x in json)
      {
        users_post_list.add(
            user_post_model.fromJson(x)
        );
      }
      print(json[0]);
      print(users_post_list.length);
      return user_post_model.fromJson(json[0]);
    }
    else{
      throw Exception("error");
    }
  }*/



}