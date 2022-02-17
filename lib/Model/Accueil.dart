import 'package:flutter/material.dart';
import 'package:reschool/Model/GoogleMaps.dart';
import 'package:reschool/Model/maps.dart';
import 'package:reschool/Model/reclamation.dart';
import 'package:reschool/signup.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List item = [
      {"image": "Image/1.png", "title": "État poubelle", "page": GM()},
      {"image": "Image/2.png", "title": "État camion", "page": Login()},
      {"image": "Image/3.png", "title": "Zone de dépôt", "page": Login()},
      {"image": "Image/4.png", "title": "Réclamation", "page": Signaler()},
      {"image": "Image/5.png", "title": "Paramètre", "page": Signaler()},
      {"image": "Image/6.png", "title": "Se déconnecter", "page": Login()}
    ];
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Login()),
            ),
          ),
          backgroundColor: Color(0xFF20E08F),
          title: Text("Accueil",
              style: TextStyle(
                fontFamily: "hindi",
                fontSize: 30,
              ))),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 60,
        padding: EdgeInsets.all(20),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (item[i]['page'])),
                  );
                },
              ),
              SizedBox(
                height: 6,
              ),
              InkWell(
                child: Text(
                  item[i]['title'],
                  style: TextStyle(
                    fontFamily: "hindi",
                    fontSize: 20,
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (item[i]['page'])),
                  );
                },
              ),

            ],
          );
        }),
      ),
    );
  }
}
