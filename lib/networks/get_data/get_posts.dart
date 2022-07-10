
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:illuminate/networks/models/Profile_id_model.dart';
import 'package:illuminate/networks/models/comments_model.dart';

import 'package:illuminate/networks/models/post_model.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import '../../providers/Shared_pref.dart';

class Prov_get_posts with ChangeNotifier
{
  profile_model ? profile;
  Color clr=Colors.black26;


  List<post_model> posts_list=[];
  List<profile_model> Profile_data_list=[];
  Map<String,profile_model> profile_map={};
  List<post_model> Fav_posts_list=[];
  List<comments>  Coments_list=[];
  Future<void> getposts() async
  {
    const String url="http://mohamedelbadry.me/illuminate/api/post/list";
    final response=await http.get(Uri.parse(url),
    headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    });

    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body)['data'];
      //print(json);
      posts_list.clear();
      Profile_data_list.clear();
      for(var x in json)
      {
        posts_list.add(
          post_model.fromJson(x)
        );

      }
      for(var i in posts_list)
        {
          Profile_data_list.add(
            await getusersdata(i.userId!),
          );
        }
      for(var i in Profile_data_list)
        {
          profile_map.putIfAbsent(i.data!.profile!.id.toString(), () => i);
        }

      print("11111111111111111111111111111111111111");


    }
    else{
      throw Exception("error");
    }

    notifyListeners();
  }


  Future<profile_model> getusersdata(int id) async
  {
    final String url="http://mohamedelbadry.me/illuminate/api/profile/details/$id";
    final response3= await http.get(Uri.parse(url),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    } );
    print(response3.statusCode);
    if(response3.statusCode==200)
    {
      profile=null;

      final json=jsonDecode(response3.body);
      profile_model.fromJson(json);
      return profile_model.fromJson(json);

    }
    else{
      throw Exception("error");
    }
    notifyListeners();
  }

  Future<void> Like_post(post_model data,int id) async
  {


  final String url="http://mohamedelbadry.me/illuminate/api/posts/like/$id";
    final response= await http.post(Uri.parse(url),headers:{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    } );
    print(id);
    print(response.statusCode);
    if(response.statusCode==200)
    {
      print(response.statusCode);




    }
    else{
      throw Exception("error");
    }
    notifyListeners();
  }

  Color getlikecolor(post_model data,var id)
  {
    for (var map in data.likes!.toList()) {
      if(map.userId==id)
      {
        return Colors.red;
      }
      else
        {
          return Colors.white38;
        }
    }
    return Colors.black38;
  }







  List<post_model> Likes_posts(int id)
  {
    Fav_posts_list=[];
    for(var data in posts_list)
      {
        for (var map in data.likes!.toList()) {
          if(map.userId==id)
          {
            Fav_posts_list.add(data);
          }

        }
      }
    print("favvvvvv:${Fav_posts_list.length}");
    print("///////////////////////");
    return Fav_posts_list;

  }



  Future<void> get_comments(int postid) async
  {
    print("iddddddddddddddddd:$postid");
    final String url="http://mohamedelbadry.me/illuminate/api/comment/list/$postid";
    final response= await http.get(Uri.parse(url),headers:{
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    } );
    print(postid);
    print(response.statusCode);
    if(response.statusCode==200)
    {
      print(response.body);
      final json=jsonDecode(response.body)['data'];
      Coments_list.clear();
      for(var x in json)
      {
        Coments_list.add(
            comments.fromJson(x)
        );
      }
      print(Coments_list.length);



    }
    else{
      throw Exception("error");
    }
    notifyListeners();
  }
  Future<void> Add_comments(int postid,String body) async
  {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    };
    var request = http.MultipartRequest('POST', Uri.parse('http://mohamedelbadry.me/illuminate/api/comment/create/$postid'));
    request.fields.addAll({
      'body': '$body',
      'post_id': '$postid'
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

  Future<void> delete_post(int id) async
  {
    final String url="http://mohamedelbadry.me/illuminate/api/post/delete/$id";
    final response3= await http.delete(Uri.parse(url),headers:{
      'Accept': 'application/json',
      'Authorization': 'Bearer $user_taken'
    } );
    print(response3.statusCode);
    if(response3.statusCode==200)
    {

     print(response3.body);
    }
    else{
      throw Exception("error");
    }
    notifyListeners();
  }







}
