import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class Prov_profile_page with ChangeNotifier {
  String ? user_taken;
  String College = "";
  String Username = "";
  String email = "";
  String Password = "";
  String Address = "";
  String Phone = "";
  File ? profimg;
  String Age = "";
  File? imgfile;
  bool showdata=true;
  bool con_showdata=true;
  String errortext="";
  String type="";

  Changeprofiledata(String name,String address,String phone,String age,String college,String pass)
  {
    if(name.isNotEmpty){
      Username = name;
    }
    if(address.isNotEmpty)
      {
        Address = address;
      }
    if(phone.isNotEmpty)
    {
      Phone = phone;
    }
    if(imgfile!=null)
    {
      profimg=imgfile;
    }
    if(age.isNotEmpty){
      Age=age;
    }
    if(college.isNotEmpty){
      College=college;
    }
    if(pass.isNotEmpty){
      Password=pass;
    }

    notifyListeners();
  }
  changeuser(String user)
  {
    Username = user;
    notifyListeners();
  }

  Pickimagefromsource(ImageSource source) async
  {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: source);
    imgfile=File(pickedFile!.path);
    print(imgfile!.path);

    notifyListeners();

  }
  tsetapi() async
  {


    /*Map<String, String> headers = {

      HttpHeaders.authorizationHeader:
      "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDQwNmE0OGM5OGY5ZjVmZTU3NDIyOGQ3YTcwYWQxODBiZTRkYjMwYzllYjZmNjlhYjBkODIxZDFiOTdkMzhlNGRhNTliMTFmNDVhNzY1ODMiLCJpYXQiOjE2NTIxNDk2OTQuMTY3NzI4LCJuYmYiOjE2NTIxNDk2OTQuMTY3NzMxLCJleHAiOjE2ODM2ODU2OTQuMTYzNDI4LCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.d08zzzu9PAR_5eErP5vqAbOopMlGTJZIwtMbCXbcH65DfezAxIpcYBdxauOmrdQMupos_TAJRF3xDXU4ZIj1ciwdjYSULRZKpOb0NKGkKgJ68nP28EP669ihKSp9C234r54PN3OEad9lJu7osCZQxgxjuCB4QKYsnIIlWtL4qdWAmkuYC3_Zj-8k9BjhxO9qMSM0IuX6W6XaruAJyUxuDCQ3Jw60IHmNqc5qGFM3BkgTzXfD9lWYu3nPivdYvQkuFbV59rOr4lt_HwOipMAWdGnepmEiZLmdvg9tq5nS7ugZjDs63b4LTfu8qWL49vtNHkoMQj7_EjFzP7Rb5eMbWP8qrHpKQKbXKCRX8MjQSSOCTiBbWNa27jve81gIJrX0H_wOuBJ58pupEApymiJ2IowHqcf1Yexq9BlGUzETE7xR2M2G0fSuvnGdNsHsqfiWctORiq2Js0srTbtvtyCmT_hlOWfTOIJOk_GzCcHcvsdAChAKXX7T6LcEid9"
    };
    Uint8List imgbyte=await imgfile!.readAsBytes();
    String base64=base64Encode(imgbyte);
    var fileStream = new http.ByteStream(DelegatingStream.typed(File(imgfile!.path).openRead()));
    var length = await imgfile!.length();
    var multipartFile = new http.MultipartFile('image', fileStream, length,
        filename: imgfile!.path.split("/").last);

    var request = new http.MultipartRequest("POST", Uri.parse("http://crona.codes/illuminate/api/create"));
    request.headers.addAll({
      HttpHeaders.authorizationHeader:
    "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZDQwNmE0OGM5OGY5ZjVmZTU3NDIyOGQ3YTcwYWQxODBiZTRkYjMwYzllYjZmNjlhYjBkODIxZDFiOTdkMzhlNGRhNTliMTFmNDVhNzY1ODMiLCJpYXQiOjE2NTIxNDk2OTQuMTY3NzI4LCJuYmYiOjE2NTIxNDk2OTQuMTY3NzMxLCJleHAiOjE2ODM2ODU2OTQuMTYzNDI4LCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.d08zzzu9PAR_5eErP5vqAbOopMlGTJZIwtMbCXbcH65DfezAxIpcYBdxauOmrdQMupos_TAJRF3xDXU4ZIj1ciwdjYSULRZKpOb0NKGkKgJ68nP28EP669ihKSp9C234r54PN3OEad9lJu7osCZQxgxjuCB4QKYsnIIlWtL4qdWAmkuYC3_Zj-8k9BjhxO9qMSM0IuX6W6XaruAJyUxuDCQ3Jw60IHmNqc5qGFM3BkgTzXfD9lWYu3nPivdYvQkuFbV59rOr4lt_HwOipMAWdGnepmEiZLmdvg9tq5nS7ugZjDs63b4LTfu8qWL49vtNHkoMQj7_EjFzP7Rb5eMbWP8qrHpKQKbXKCRX8MjQSSOCTiBbWNa27jve81gIJrX0H_wOuBJ58pupEApymiJ2IowHqcf1Yexq9BlGUzETE7xR2M2G0fSuvnGdNsHsqfiWctORiq2Js0srTbtvtyCmT_hlOWfTOIJOk_GzCcHcvsdAChAKXX7T6LcEid9"
    });
   request.fields['address'] = 'aga';
    request.fields["longitude"]="30";
    request.fields["latitude"]="30";
    request.fields["phone"]="01015876911";
    request.fields["college"]="met";
    if (imgfile != null) {
      print(imgfile!.path.split(".").last);
      request.files.add(
        await http.MultipartFile.fromPath(
          "image",
          imgfile!.path,
          filename: "test.${imgfile!.path.split(".").last}",
          contentType: MediaType(
              "image", "${imgfile!.path.split(".").last}"),
        ),
      );
    }
   /* var multipartFile = await http.MultipartFile.fromPath(
        'image', imgfile!.path); //returns a Future<MultipartFile>
    request.files.add(multipartFile);
    http.StreamedResponse response = await request.send();
    final respStr = await response.stream.bytesToString();
    var jsonData = jsonDecode(respStr); */

    var response = await request.send();
      print(response.statusCode);
      if(response.statusCode!=0){
        response.headers;
      print("-------------------------------------");
      print(request.fields.keys);};*/


  }



  void changeshow(bool data)
  {
    showdata=!data;
    notifyListeners();
  }
  void con_changeshow(bool data)
  {
    showdata=!data;
    notifyListeners();
  }

  void checkpassword(String pass1,String pass2)
  {
    if(pass1!=pass2)
      {
        errortext="كلمة المرور غير متطابقه";
      }
    else{
      errortext="";
    }
    notifyListeners();
  }


}
