import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:illuminate/networks/Api.dart';
import 'package:illuminate/networks/models/usermodel.dart';
List<usermodel> users_list=[];
Map <double,usermodel>sortedMap={};
List<usermodel> instructor_orderd=[];
usermodel? userauth;
List<Map<double,String>> userdis=[];
class userlogin{
  Future<usermodel> getusersdata() async
  {
    final String url="https://jsonplaceholder.typicode.com/users";
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200)
    {
      final json=jsonDecode(response.body);
      users_list.clear();
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
  Future<void> getdistance()
  async {
    print(userauth!.email);
    instructor_orderd=[];
    Map<double,usermodel> userdis={};
    for(usermodel user in users_list) {
      double distanceInMeters = await Geolocator.distanceBetween(
        double.parse("${userauth!.address!.geo!.lat}"),
        double.parse("${userauth!.address!.geo!.lng}"),
        double.parse("${user.address!.geo!.lat}"),
        double.parse("${user.address!.geo!.lng}"),);

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
      print(instructor_orderd.map((e) => e.name));
      print(instructor_orderd[0].name);
    print("-------------------------------------------");
    Addnewuser();


  }
  Future<postmodel> Addnewuser() async
  {
    final String url="https://jsonplaceholder.typicode.com/posts";
    final response=await http.post(Uri.parse(url),body: json.encode(
      postmodel(
        id: 1000,
        userId: 2000,
        title: "mahmoud",
        body: "7odaaaaaaaaaaaaaaaaaaaaaaa",
      ).toJson()
    ));
    final responseget=await http.get(Uri.parse(url));
    if(responseget.statusCode==200)
    {
      final json=jsonDecode(responseget.body);
      for(var x in json)
      {
      }
      print(json[99]);
      return postmodel.fromJson(json[0]);
    }
    else{
      throw Exception("error");
    }
  }



}