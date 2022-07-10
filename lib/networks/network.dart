import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:illuminate/networks/Api.dart';
List<postmodel> Listpost=[];
class postdata{
 Future<postmodel> getpostdata() async
  {
    const String url="https://jsonplaceholder.typicode.com/posts";
    final response=await http.get(Uri.parse(url));

    if(response.statusCode==200)
      {
        final json=jsonDecode(response.body);

        for(var x in json)
          {
            Listpost.add(
                postmodel.fromJson(x)
            );
          }
        print(json[0]);
        print(Listpost.length);

        return postmodel.fromJson(json[0]);

      }
    else{
      throw Exception("error");
    }


  }
}