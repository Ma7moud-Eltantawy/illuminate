import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:illuminate/networks/Api.dart';
import 'package:illuminate/networks/models/usermodel.dart';
List<usermodel> users_list=[];
 usermodel? userauth;
class userlogin{
  Future<usermodel> getusersdata() async
  {
    final String url="https://jsonplaceholder.typicode.com/users";
    final response=await http.get(Uri.parse(url));

    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body);

      for(var x in json)
      {
        users_list.add(
            usermodel.fromJson(x)
        );
      }
      print(json[0]);
      print(users_list.length);

      return usermodel.fromJson(json[0]);

    }
    else{
      throw Exception("error");
    }


  }

  void getuser(String email)
  {
     userauth=users_list.firstWhere((element) => element.email==email);
  }
}