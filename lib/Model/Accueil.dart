import 'package:flutter/material.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color(0xFF20E08F),
            title: Text("Accueil",
                style: TextStyle(
                  fontFamily: "hindi",
                  fontSize: 30,
                ))),
        body: Container(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: GridView(
                  shrinkWrap: true,
                  children: [
                    Container(


                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    decoration: const BoxDecoration(

                            image: DecorationImage(

                          image: AssetImage("Image/1.png"),
                        )),

                            child:Text("Etat poubelle") ,    )

                              ],
                            )
                                ),

                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("Image/2.png"),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("Image/3.png"),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("Image/4.png"),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("Image/5.png"),
                      )),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage("Image/6.png"),
                      )),
                    )
                  ],
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20,
                      crossAxisSpacing: 20)),
            )
            )
            );
  }
}
