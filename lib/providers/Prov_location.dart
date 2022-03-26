import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Prov_loc with ChangeNotifier
{
  late LatLng  currentLatLng;
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  late List<Placemark> placemarks;
  late Placemark placeMark;
  late String cityname;
  late String countryname;
  late String address;
  late String locality;
  Future<Position> getCurrentLocation() async
  {
    var current_positin = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentLatLng = new LatLng(current_positin.latitude, current_positin.longitude);
    return current_positin;
  }
  void onMapCreated(controller) {
      mapController = controller;
    notifyListeners();
  }
  mylocationnavigate()async{
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:currentLatLng, zoom: 15, ),));
    await getPlace(currentLatLng.latitude,currentLatLng.longitude);

    final marker = Marker(
      markerId: MarkerId('myposition'),
      position:currentLatLng,

      // icon: BitmapDescriptor.,
      infoWindow: InfoWindow(
        title: address,

      ),
    );
   markers[MarkerId('myposition')] = marker;
   notifyListeners();

  }
  searchnavigate(String searchAdd) async {

    locationFromAddress(searchAdd).then((result) async {
      await getPlace(result[0].latitude, result[0].longitude);
      final marker = Marker(
        markerId: MarkerId('place_name'),
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
      markers[MarkerId('place_name')] = marker;
      print(result[0].longitude);
    });
    notifyListeners();
  }
  Future<void> getPlace(double lat,double lang)  async {
    placemarks = await placemarkFromCoordinates(lat, lang);

    // this is all you need
    Placemark placeMark  = placemarks[0];
     cityname = placeMark.name!;
     countryname= placeMark.country!;
    locality = placeMark.locality!;
     address = "${locality},${cityname},${countryname}";
     notifyListeners();
  }

}