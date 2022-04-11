import 'package:flutter/material.dart';
class postdata{
  final int ? id;
  final String?user;
  final String userimg;
  final String ?img;
  final String ?likesnum;
  final List? comments;
  final String? Posttext;
  postdata({
    required this.id,this.img,this.comments,this.likesnum,required this.user,required this.userimg,required this.Posttext
});

}

class Prov_instructor_home with ChangeNotifier
{

  List<postdata> Posts_data=[
    postdata(id: 1,user: "mahmoudeltantawy",userimg:"assets/img/tantawy.jpg",img: "assets/img/tantawy.jpg" ,Posttext: "رمضان كريييم",likesnum: "1"),
    postdata(id: 1,user: "mahmoudeltantawy",userimg:"assets/img/tantawy.jpg",img: "" ,Posttext: "رمضان كريييم",likesnum: "3"),
    postdata(id: 1,user: "mahmoudeltantawy",userimg:"assets/img/hamama.jpg",img: "assets/img/hamama.jpg" ,Posttext: "رمضان كريييم",likesnum: "2"),
    postdata(id: 1,user: "mahmoudeltantawy",userimg:"assets/img/tantawy.jpg",img: "" ,Posttext: "رمضان كريييم",likesnum: "2"),
    postdata(id: 1,user: "mahmoudeltantawy",userimg:"assets/img/tantawy.jpg",img: "assets/img/tantawy.jpg" ,Posttext: "رمضان كريييم",likesnum: "4"),
    postdata(id: 1,user: "mahmoudeltantawy",userimg:"assets/img/tantawy.jpg",img: "assets/img/tantawy.jpg" ,Posttext: "رمضان كريييم",likesnum: "1"),

  ];
  int Numreq()
  {
    return Posts_data.length;

  }








}