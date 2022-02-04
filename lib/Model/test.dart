import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myImageAndCaption = [
      ["Image/1.png", "État poubelle"],
      ["Image/2.png", "État camion"],
      ["Image/3.png", "Zone de dépôt"],
      ["Image/4.png", "Réclamation"],
      ["Image/5.png", "Paramètre"],
      ["Image/6.png", "Se déconnecter"]
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xFF20E08F),
          title: Text("Accueil",
              style: TextStyle(
                fontFamily: "hindi",
                fontSize: 30,
              ))),
      body:
       GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 60,

padding: EdgeInsets.all(20),

        children: [

          ...myImageAndCaption.map(
            (i) => Column(

            mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Material(

                  child: Image.asset(
                    i.first,
                    fit: BoxFit.contain,
            width:140,
            height: 140,
                  ),
                ),
                SizedBox(
height: 6,
                ),





                    Text(i.last, style: TextStyle(
                      fontFamily: "hindi",
                      fontSize: 20,
                    ),
                  ),
                   SizedBox(
height: 6,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
