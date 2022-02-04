import 'package:flutter/material.dart';

class Signaler extends StatelessWidget {
  const Signaler({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    List panne = [
      "panne poubelle",
      "panne camion",
      "acident",
      "incident",
      "Autres"
    ];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: const Color(0xFF20E08F),
                title: const Text("Récalamtion",
                    style: TextStyle(
                      fontFamily: "hindi",
                      fontSize: 30,
                    ))),
            body: Container(

              child: ListView.builder
              (itemCount:5,itemBuilder: (context, i) {



                return ListTile(

                  title: Text("${panne[i]}"),
                  trailing: Icon(Icons.arrow_right_alt),
                );
              }),
            )
            )
            );
  }
}
