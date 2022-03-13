import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:reschool/Model/block.dart';
import 'package:reschool/Model/function.dart';

class Parametre extends StatefulWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  LatLng reschoolLatLng = const LatLng(36.842597, 10.204778);
  LatLng isgLatLng = const LatLng(36.804441, 10.150433);
  LatLng essectLatLng = const LatLng(36.78713358412422, 10.174800332167468);
  LatLng isiLatLng = const LatLng(36.86152919225548, 10.188919226349846);
  double etatIsgBlockAPlastique = 90.0;
  double etatIsgBlockACarton = 90.0;
  double etatIsgBlockAAutres = 80.0;
  double etatIsgBlockAComposte = 70.0;
  double etatIsgBlockCPlastique = 60.0;
  double etatIsgBlockCCarton = 50.0;
  double etatIsgBlockCAutres = 40.0;
  double etatIsgBlockCComposte = 30.0;
  double etatIsgBlockBPlastique = 20.0;
  double etatIsgBlockBCarton = 10.0;
  double etatIsgBlockBAutres = 90.0;
  double etatIsgBlockBComposte = 80.0;
  double etatIsgBlockDPlastique = 70.0;
  double etatIsgBlockDCarton = 60.0;
  double etatIsgBlockDAutres = 50.0;
  double etatIsgBlockDComposte = 40.0;

  double etatIsg = 99.00;
  double etatIsi = 50.00;
  double etatReschool = 76.00;
  double etatEssect = 2.00;
  Check check = Check();

  late List block = [
    {
      "Block": "Block A",
    },
    {
      "Block": "Block B",
    },
    {
      "Block": "Block C",
    },
    {
      "Block": "Block D",
    }
  ];
  late List blockA = [
    {
     "Type":"Plastique" ,"Etat": etatIsgBlockAPlastique,
    },
    {"Type":"Carton","Etat": etatIsgBlockACarton},
    {"Type":"Autres","Etat": etatIsgBlockAAutres},
    {
      "Type":"Plastique","Etat": etatIsgBlockAComposte,
    }
  ];
  late List blockIsg = [
    etatIsgBlockCPlastique,
    etatIsgBlockCCarton,
    etatIsgBlockCAutres,
    etatIsgBlockCComposte,
    etatIsgBlockBPlastique,
    etatIsgBlockBCarton,
    etatIsgBlockBAutres,
    etatIsgBlockBComposte,
    etatIsgBlockDCarton,
    etatIsgBlockDAutres,
    etatIsgBlockDComposte
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.separated(
              itemCount: block.length,
              itemBuilder: (context, i) {
                block.sort((a, b) => b['Block'].compareTo(a['Block']));
                return Card(
                    child: ExpansionTile(
                        title: Text('${block[i]['Block']}'),
children: [
  ListTile(title: Text("${blockA[i]['Type']}"),)





                        ]));
              },
              separatorBuilder: (context, index) {
                return const Divider(thickness: 2);
              },
            ),
          )
        ],
      ),
    ));
  }
}
