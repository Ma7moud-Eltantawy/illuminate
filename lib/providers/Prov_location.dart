import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Prov_loc with ChangeNotifier
{
  String ?newlang;
  String ?newlat;
  String ?newaddress;
  LatLng ? longlat;

  late LatLng  currentLatLng;
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  late List<Placemark> placemarks;
  late Placemark placeMark;
  late String cityname;
  late String countryname;
  String ? address;
  late String locality;
  Future<Position> getCurrentLocation() async
  {
    var currentPositin = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentLatLng = LatLng(currentPositin.latitude, currentPositin.longitude);
    longlat=currentLatLng;
    return currentPositin;
  }
  void onMapCreated(controller) {
      mapController = controller;
    notifyListeners();
  }
  mylocationnavigate()async{
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:currentLatLng, zoom: 15, ),));
    await getPlace(currentLatLng.latitude,currentLatLng.longitude);

    final marker = Marker(
      markerId: const MarkerId('myposition'),
      position:currentLatLng,

      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: address,

      ),
    );
   markers[const MarkerId('myposition')] = marker;
   notifyListeners();

  }
  searchnavigate(String searchAdd) async {

    locationFromAddress(searchAdd).then((result) async {
      await getPlace(result[0].latitude, result[0].longitude);
      longlat=LatLng(result[0].latitude, result[0].longitude);
      final marker = Marker(
        markerId: const MarkerId('place_name'),
        position: LatLng(result[0].latitude, result[0].longitude),
        // icon: BitmapDescriptor.,
        infoWindow: InfoWindow(
          title: address,

        ),
      );
     mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(result[0].latitude, result[0].longitude),
        zoom: 15,

      )));
      markers[const MarkerId('place_name')] = marker;
      print(result[0].longitude);
    });
    notifyListeners();
  }
  Future<void> getPlace(double lat,double lang)  async {
    placemarks = await placemarkFromCoordinates(lat, lang);

    // this is all you need
    Placemark placeMark  = placemarks[0];
     cityname = placeMark.administrativeArea!;
     countryname= placeMark.country!;
    locality = placeMark.locality!;
     address = "$locality,$cityname,$countryname";
     notifyListeners();
  }
  void update_loc()
  {
    newlang=longlat!.longitude.toString();
    newlat=longlat!.latitude.toString();
    newaddress=address;
    print(newaddress);
    notifyListeners();
  }

}