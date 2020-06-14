import 'package:flutter/material.dart';


class mapPage extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<mapPage> {
  
  GoogleMapController mapController;
   double lat = 45.521563;
   double long = -122.677433;

    void _onMapcreated(GoogleMapController controller) {
      mapController = controller;
    }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Google Maps"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: latLng(lat, long),
          zoom: 11.0,
        )
      ) ,
    );
  }
}