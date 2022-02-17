import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:reschool/Model/Accueil.dart';
import 'package:latlong2/latlong.dart' as latLng;
import 'package:awesome_dialog/awesome_dialog.dart';


class Maps extends StatefulWidget {
  Maps({Key? key}) : super(key: key);

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  late Position c1;
  var lat;
  var long;
  Future getper() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      AwesomeDialog(
          context: context,
          title: "services",
          body: Text("Pour continuer, activez la localisation de l'appareil"))
        ..show();
    }
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
    }
  }

  Future<Position> getLatAndLong() async {
   return c1 = await Geolocator.getCurrentPosition().then((value) => value);


  }

  @override
  void initState() {
    getper();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Accueil()),
          ),
        ),
        backgroundColor: Color(0xFF26E08F),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(36.841904, 10.205192),
          zoom: 17.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/abbtn/ckzo408ny001614rz5jsath1n/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiYWJidG4iLCJhIjoiY2t5dHpvNXc5MWJ1MjJvdGdrb3ZzYTl1NCJ9.mA-3ZyVe_A9M5QjACshsVg",
              additionalOptions: {
                ' accessToken':
                    'pk.eyJ1IjoiYWJidG4iLCJhIjoiY2t5dHpvNXc5MWJ1MjJvdGdrb3ZzYTl1NCJ9.mA-3ZyVe_A9M5QjACshsVg',
                'id': 'mapbox.mapbox-streets-v8'
              }),
          /*MarkerLayerOptions(
        markers: [
          Marker(
            width: 80.0,
            height: 80.0,
            point: LatLng(51.5, -0.09),
            builder: (ctx) =>
            Container(
              child: FlutterLogo(),
            ),
          ),
        ],
      ),*/
        ],
      ),
    );
  }
}
//AIzaSyC0au9FbVLUYFvC5gRFnmXtiNYUgzM8Rwc