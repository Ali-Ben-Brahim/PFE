import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reschool/Model/Accueil.dart';
import 'package:reschool/Model/block.dart';
import 'package:reschool/Model/function.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  late StreamSubscription<Position> positionStream;
  String googleAPiKey = "AIzaSyCM_y_hH1jw8ucuvhzfmGdKMloxPwBjbAo";
  Set<Marker> markers = {};
  double distance = 0.0;
  LatLng reschoolLatLng = const LatLng(36.842597, 10.204778);
  LatLng isgLatLng = const LatLng(36.804441, 10.150433);
  LatLng essectLatLng = const LatLng(36.78713358412422, 10.174800332167468);
  LatLng isiLatLng = const LatLng(36.86152919225548, 10.188919226349846);
  double etatIsg = 99.00;
  double etatIsi = 50.00;
  double etatReschool = 76.00;
  double etatEssect = 2.00;
  Check check = Check();
  late final CameraPosition _Myplace = const CameraPosition(
      target: LatLng(36.842597, 10.204778), zoom: 14.151926040649414);
  late List test = [];

  late List marker = [
    {"place": essectLatLng, "title": "ESSECT", "Etat": etatEssect},
    {"place": reschoolLatLng, "title": "ReSchool", "Etat": etatReschool},
    {"place": isgLatLng, "title": "ISG", "Etat": etatIsg},
    {"place": isiLatLng, "title": "ISI", "Etat": etatIsi}
  ];

  @override
  void initState() {
    distanceTry();
    getPostion();
    super.initState();
  }

  distanceTry() {
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream().listen((Position? ps) {
      List<double> test2 = [];

      List<dynamic> data = [
        {
          "lat": ps == null ? 0.0 : ps.latitude,
          "lng": ps == null ? 0.0 : ps.longitude,
        },
        {"lat": essectLatLng.latitude, "lng": essectLatLng.longitude},
        {"lat": reschoolLatLng.latitude, "lng": reschoolLatLng.longitude},
        {"lat": isgLatLng.latitude, "lng": isgLatLng.longitude},
        {"lat": isiLatLng.latitude, "lng": isiLatLng.longitude},
      ];

      double totalDistance = 0;

      for (var i = 0; i < data.length - 1; i++) {
        totalDistance = Geolocator.distanceBetween(data[0]["lat"],
            data[0]["lng"], data[i + 1]["lat"], data[i + 1]["lng"]);
        test2.add(totalDistance / 1000);
      }

      setState(() {
        for (var i = 0; i < marker.length; i++) {
          if (marker[i]["title"] == 'ESSECT') {
            marker[i]["distance"] = test2[0];
          } else if (marker[i]["title"] == 'ReSchool') {
            marker[i]["distance"] = test2[1];
          } else if (marker[i]["title"] == 'ISG') {
            marker[i]["distance"] = test2[2];
          } else if (marker[i]["title"] == 'ISI') {
            marker[i]["distance"] = test2[3];
          }
        }
      });
    });
  }

  Future<void> goToplace(LatLng place) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: place, zoom: 17)));
  }

  Future getPostion() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    List.generate(
      marker.length,
      (index) => markers.add(
        Marker(
          markerId: MarkerId(marker[index]["place"].toString()),
          position: marker[index]["place"],
          infoWindow: InfoWindow(
              title: marker[index]["title"],
              snippet: 'Etat poubelle : ${marker[index]["Etat"]} %'),
          icon: check.check2(marker[index]["Etat"]),
        ),
      ),
    );
    return Scaffold(
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView.separated(
            itemCount: marker.length,
            itemBuilder: (context, i) {
              marker.sort((a, b) => a['distance'].compareTo(b['distance']));
              return Column(children: [
                ListTile(
                    title: Text("${marker[i]['title']}"),
                    subtitle: Text(
                      'Etat poubelle : ${marker[i]['Etat']} % Distance: ${marker[i]['distance'].toStringAsFixed(2)} KM',
                      style: const TextStyle(fontSize: 13),
                    ),
                    trailing: InkWell(
                      onTap: () => Get.to(const Block()),

                      child: Image.asset("Image/arrow-right.png"),
                    ),
                    leading: Icon(
                      Icons.location_on,
                      color: check.check(marker[i]['Etat']),
                      size: 38.0,
                    ),
                    onTap: () {
                      switch (marker[i]["title"]) {
                        case "ISG":
                          goToplace(isgLatLng);

                          break;
                        case "ESSECT":
                          goToplace(essectLatLng);

                          break;
                        case "ReSchool":
                          goToplace(reschoolLatLng);

                          break;
                        case "ISI":
                          goToplace(isiLatLng);

                      }
                    }),
              ]);
            },
            separatorBuilder: (context, index) {
              return const Divider(thickness: 2);
            },
          ),
        ),
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Get.offAll(const Accueil())

          ),
          backgroundColor: const Color(0xFF196f3d),
        ),
        body: _Myplace == null
            ? const CircularProgressIndicator()
            : Stack(children: [
                GoogleMap(
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  tiltGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  zoomGesturesEnabled: true,
                  markers: markers,
                  mapType: MapType.normal,
                  initialCameraPosition: _Myplace,
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                ),
              ]));
  }
}
//AIzaSyCM_y_hH1jw8ucuvhzfmGdKMloxPwBjbAo