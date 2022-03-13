import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:reschool/Model/Accueil.dart';
import 'package:reschool/Model/function.dart';
import 'package:reschool/Model/test.dart';

class Block extends StatefulWidget {
  const Block({Key? key}) : super(key: key);

  @override
  State<Block> createState() => _BlockState();
}

class _BlockState extends State<Block> {
  Check check = Check();

  List item = [
    {"image": "Image/7.png", "type": "Plastique", 'percent': 90.00},
    {"image": "Image/8.png", "type": "Composte", 'percent': 70.00},
    {"image": "Image/9.png", "type": "Autres", 'percent': 20.00},
    {"image": "Image/10.png", "type": "Cartoon", 'percent': 80.00}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.to(const MapSample());
              }),
          backgroundColor: const Color(0xFF196f3d),
          title: const Text("Block ISG",
              style: TextStyle(
                fontFamily: "hindi",
                fontSize: 30,
              ))),
      body: GridView.count(
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 1),
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        padding: const EdgeInsets.all(20),
        children: List.generate(
            item.length,
            (i) => Container(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(
                      item[i]['type'],
                      style: const TextStyle(
                        fontFamily: "hindi",
                        fontSize: 28,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(5)),
                    Stack(alignment: Alignment.center, children: [
                      Image.asset(
                        item[i]['image'],
                        width: 120,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        width: 80,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(40),
                            )),
                        height: 80,
                        child: CircularPercentIndicator(
                          animation: true,
                          radius: 40,
                          lineWidth: 12,
                          percent: (item[i]['percent']) / 100,
                          progressColor: check.check(item[i]['percent']),
                          backgroundColor: Colors.grey,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '${item[i]['percent']} %',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ]),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xFFc60001)),
                        fixedSize:
                            MaterialStateProperty.all(const Size(150, 40)),
                      ),
                      onPressed: () {
                        Get.offAll(const Accueil());
                      },
                      child: const Text('Vider la poubelle'),
                    ),
                  ],
                ))),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
