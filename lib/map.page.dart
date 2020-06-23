import 'package:flutter/material.dart';


class mapPage extends StatefulWidget {
  @override
  _mapState createState() => _mapState();
}

class _mapState extends State<mapPage> {
  
  GoogleMapController mapController;
  set<Marker> markers = new set<Marker>();
   double lat = -46.3670213;
   double long = -23.463579;

    void _onMapcreated(GoogleMapController controller) {
      mapController = controller;
    }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          onSubmitted: (val) {
            lat = -46.3670213;
            long= -23.463579;

            Latlng position = Latlng (lat ,long);
            mapController.moveCamera(cameraUpdate.newLatlng(position));

            final Marker marker = Marker(
              markerId: new MarkerId("12345"),
              position: position,
              infoWindow: infoWindow(
                title: "sua Localização",
                snippet: 'Itaquaquecetuba/SP',
              ),
            );
            setState(() {
              markers.add(marker);
            });
          }
        ),
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          onCameraMove: (data) {
            print(data);
          },
          onTap: (position) {
            print(position);
          }
        )
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: 11.0,
        ),
        markers: markers,
      ) ,
    );
  }
}