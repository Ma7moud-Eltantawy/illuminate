import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:illuminate/Screens/stu_home_screen.dart';
import 'package:illuminate/Screens/Login.dart';
import 'package:illuminate/providers/Prov_location.dart';
import 'package:illuminate/providers/Prov_login_signup.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'instructor_home_screen.dart';
class Loc_Screen extends StatefulWidget {
  static const scid="loc";
  const Loc_Screen({Key? key}) : super(key: key);

  @override
  _Loc_ScreenState createState() => _Loc_ScreenState();
}

class _Loc_ScreenState extends State<Loc_Screen> {


  late String searchAdd;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var size=MediaQuery.of(context).size;
    var height=size.height;
    var width =size.width;
    return SafeArea(
      child: Scaffold(

        body: Stack(
          children: [
            FutureBuilder(
              future: Provider.of<Prov_loc>(context,listen: false). getCurrentLocation(),
              builder:(context,snapshot)=>snapshot.hasData?
              Consumer<Prov_loc>(
                builder:(ctx,pr,ch)=> GoogleMap(
                  markers:pr.markers.values.toSet(),
                  onMapCreated: Provider.of<Prov_loc>(context,listen: false).onMapCreated,
                  initialCameraPosition:
                  CameraPosition(target:Provider.of<Prov_loc>(context,listen: false).currentLatLng, zoom: 15.0),
                ),
              ):Container(
                  height: height,
                  width: width,
                  color: Colors.white,
                  child: Center(child: CircularProgressIndicator())),
            ),
            Positioned(
              top: height/2200,
              right: width/800,
              child: GestureDetector(
                onTap: (){
                  Provider.of<Prov_loc>(context,listen: false).markers.isEmpty?
                  Alert(
                    context: context,
                    type: AlertType.warning,
                    title: "!انتبه",
                    desc: "..يجب تحديد موقعك",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "تسجيل دخول",
                          style: TextStyle(color: Colors.white, fontSize: width/30),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushNamed(Login_Screen.scid);
                        },
                        color: Color.fromRGBO(0, 179, 134, 1.0),
                      ),
                      DialogButton(
                        child: Text(
                          "محاوله مره اخرى",
                          style: TextStyle(color: Colors.white, fontSize: width/30),
                        ),
                        onPressed: () => Navigator.pop(context),
                        gradient: LinearGradient(colors: [
                          Color.fromRGBO(116, 116, 191, 1.0),
                          Color.fromRGBO(52, 138, 199, 1.0)
                        ]),
                      )
                    ],
                  ).show(): Provider.of<Login_signup_prov>(context,listen: false).usertype=="learner"?Navigator.of(context).pushNamed(Home_screen.scid):Navigator.of(context).pushNamed(Instrictor_home_screen.scid);

                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0)),
                  elevation: 5,

                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.navigate_next,size: 20,),
                  ),
                ),
              ),
            ),

            Positioned(
                bottom: height/23,
                right:width/6.5,
                left: width/6.5,


                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.red),
                  ),
                  child: RichText(
                    text: TextSpan(
                        children: [
                          WidgetSpan(child:  Icon(Icons.my_location_outlined, size: 16)),

                          TextSpan(text: "الموقع الحالى ",style: TextStyle(
                            fontFamily: 'cairo',
                              fontSize: 18
                          )),
                        ]
                    ),
                  ),
                  onPressed: (){

                      Provider.of<Prov_loc>(context,listen: false).mylocationnavigate();

                  },
                )
            ),
            Positioned(

              top: height/12,
              right: width/18,
              left: width/18,
              child: Opacity(
                opacity: .8,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.top,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      icon:IconButton(
                        icon: Icon(Icons.search),
                        onPressed: (){
                          Provider.of<Prov_loc>(context,listen: false).searchnavigate(searchAdd);
                        },
                        iconSize: width/15,
                      ),
                      hintText: 'أدخل العنوان',

                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(
                        right: width/50,

                      ),
                    ),
                    onChanged: (val) {
                      setState(() {
                        searchAdd = val;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),

      ),
    );
  }





}

