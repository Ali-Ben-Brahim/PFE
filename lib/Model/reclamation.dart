import 'package:flutter/material.dart';
import 'Accueil.dart';
import 'package:reschool/signup.dart';

class Signaler extends StatelessWidget {
  Signaler({Key? key}) : super(key: key);
  List menu = [
    {"name": "Panne Poubelle", "page": Accueil()},
    {"name": "Panne Camion", "page": Login()},
    {"name": "Signaler accident", "page": Accueil()},
    {"name": "Signaler incident", "page": Login()},
    {"name": "Autres", "page": Accueil()},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

                 leading: IconButton (icon:Icon(Icons.arrow_back),
                 onPressed: () =>  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Accueil()),
                  ),

                 ),
                 backgroundColor: Color(0xFF26E08F),

            title: Text("Récalamtion",
                style: TextStyle(
                  fontFamily: "hindi",
                  fontSize: 30,
                )),
),
        body: Container(
          child: ListView.separated(
            itemCount: menu.length,
            itemBuilder: (context, i) {
              return InkWell(
                child: Container(
                  height: 125,
                  child: Center(
                    child: ListTile(
                      title: Text("${menu[i]['name']}",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      trailing: Image.asset("Image/arrow-right.png"),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (menu[i]['page'])),
                  );
                },
              );

            },
         separatorBuilder: (context, index) {
    return Divider( thickness: 2);
  }, ),
        ),

    ),);
  }
}
