import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Prov_loc with ChangeNotifier
{
  late LatLng  currentLatLng;
  late GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
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
  searchnavigate(String searchAdd) async {

    locationFromAddress(searchAdd).then((result) {
      final marker = Marker(
        markerId: MarkerId('place_name'),
        position: LatLng(result[0].latitude, result[0].longitude),
        // icon: BitmapDescriptor.,
        infoWindow: InfoWindow(
          title: 'title',

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
}