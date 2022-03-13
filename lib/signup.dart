import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:reschool/Model/Accueil.dart';
import 'package:reschool/Model/parametre.dart';
import 'package:reschool/reclamation/poubelle.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _data = "";
  Future _Scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xFF196f3d),
          title: const Text("RE: ECOLOGIE",
              style: TextStyle(
                fontFamily: "hindi",
                fontSize: 30,
              ))),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            width: 400,
            height: 150,
            alignment: Alignment.center,
            margin: const EdgeInsets.all(30),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("Image/logo-recyclage.png"),
            )),
          ),
          Container(
            width: 295,
            height: 48,
            margin: const EdgeInsets.all(20),
            child: TextField(
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                        color: Color(0xFF196f3d), width: 2.0)),
                hintText: 'Exemple@mail.com',
                hintStyle: const TextStyle(fontSize: 16.0),
              ),
            ),
          ),
          Container(
            width: 295,
            height: 48,
            margin: const EdgeInsets.all(20),
            child: TextField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24),
                    borderSide: const BorderSide(
                        color: Color(0xFF196f3d), width: 2.0)),
                hintText: '●●●●●●●',
                hintStyle: const TextStyle(fontSize: 10.0),
              ),
            ),
          ),
          Container(
            width: 290,
            margin: const EdgeInsets.only(bottom: 60),
            alignment: Alignment.topRight,
            child: InkWell(
              child: const Text(
                "Mot de passe oublie?",
                style: TextStyle(
                fontSize: 14,
                color: Color(0xFF2989E1),
                decoration: TextDecoration.underline),
              ),
              onTap: () {
                Get.offAll(const Parametre());

              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.offAll(const Accueil());
            },
            style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                )),
                backgroundColor:
                    MaterialStateProperty.all(const Color(0xFF196f3d)),
                fixedSize: MaterialStateProperty.all(const Size(349, 48)),
                textStyle:
                    MaterialStateProperty.all(const TextStyle(fontSize: 16))),
            child: const Text('Connecter'),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: const Divider(
              thickness: 2,
            ),
          ),
          Container(
            child: const Text("ou connecter avec QR"),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(20),
              child: const Icon(
                Icons.qr_code_scanner,
                size: 72,
              ),
            ),
            onTap: () => _Scan(),
          ),
          Text(_data)
        ]),
      ),
    );
  }
}
