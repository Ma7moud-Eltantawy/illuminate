import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:illuminate/providers/Prov_location.dart';
import 'package:provider/provider.dart';

class Loc_Screen extends StatefulWidget {

  static const scid="loc";
  Widget submit;
  Loc_Screen({Key? key,required this.submit}) : super(key: key);

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
                  child: const Center(child: CircularProgressIndicator())),
            ),
     widget.submit,

            Positioned(
                bottom: height/23,
                right:width/6.5,
                left: width/6.5,


                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.red),
                  ),
                  child: RichText(
                    text: const TextSpan(
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
                        icon: const Icon(Icons.search),
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

