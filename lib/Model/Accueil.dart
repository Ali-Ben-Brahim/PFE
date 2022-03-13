import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reschool/Model/etatcamion.dart';

import 'package:reschool/Model/reclamation.dart';
import 'package:reschool/Model/test.dart';
import 'package:reschool/signup.dart';

import 'zoneDeDepot.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List item = [
      {
        "image": "Image/1.png",
        "title": "État poubelle",
        "page": const MapSample()
      },
      {"image": "Image/2.png", "title": "État camion", "page": const EtatCamion()},
      {"image": "Image/3.png", "title": "Zone de dépôt", "page": ZoneDepot()},
      {"image": "Image/4.png", "title": "Réclamation", "page": Signaler()},
      {"image": "Image/5.png", "title": "Paramètre", "page": Signaler()},
      {"image": "Image/6.png", "title": "Se déconnecter", "page": Login()}
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF196f3d),
          title: const Text("Accueil",
              style: TextStyle(
                fontFamily: "hindi",
                fontSize: 30,
              ))),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 60,
        padding: const EdgeInsets.all(20),
        children: List.generate(item.length, (i) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                child: Material(
                  child: Image.asset(
                    item[i]['image'],
                    fit: BoxFit.contain,
                    width: 140,
                    height: 140,
                  ),
                ),
                onTap: () {
                  if (item[i]['title'] =="Se déconnecter") {
                    Get.offAll(Login());
                  } else {
                    Get.to(item[i]['page']);
                  }
                },
              ),
              const SizedBox(
                height: 6,
              ),
              InkWell(
                child: Text(
                  item[i]['title'],
                  style: const TextStyle(
                    fontFamily: "hindi",
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                 if (item[i]['title'] =="Se déconnecter") {
                    Get.offAll(Login());
                  } else {
                    Get.to(item[i]['page']);
                  }
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
