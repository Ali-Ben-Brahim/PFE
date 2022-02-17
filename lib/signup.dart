import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:reschool/Model/GoogleMaps.dart';
import 'package:reschool/Model/Accueil.dart';


class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _data = "";
  _Scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "cancel", true, ScanMode.BARCODE)
        .then((value) => setState(() => _data = value));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Color(0xFF20E08F),
                title: Text("RE: ECOLOGIE",
                    style: TextStyle(
                      fontFamily: "hindi",
                      fontSize: 30,
                    ))),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(children: [
                Container(
                  width: 400,
                  height: 150,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("Image/logo-recyclage.png"),
                  )),
                ),
                Container(
                  width: 295,
                  height: 48,
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                              BorderSide(color: Color(0xFF20E08F), width: 2.0)),
                      hintText: 'Exemple@mail.com',
                    ),
                  ),
                ),
                Container(
                  width: 295,
                  height: 48,
                  margin: EdgeInsets.all(20),
                  child: TextField(
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: new InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide:
                              BorderSide(color: Color(0xFF20E08F), width: 2.0)),
                      hintText: '●●●●●●●',
                    ),
                  ),
                ),
                Container(
                  width: 290,
                  margin: EdgeInsets.only(bottom: 60),
                  alignment: Alignment.topRight,
                  child: InkWell(
                    child: Container(
                        child: Text(
                      "Mot de passe oublie?",
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2989E1),
                          decoration: TextDecoration.underline),
                    )),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => GM()),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Accueil()),
                    );
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      )),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xFF20E08F)),
                      fixedSize: MaterialStateProperty.all(Size(349, 48)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 16))),
                  child: Text('Connecter'),
                ),
Container(padding:EdgeInsets.all(20), child: Divider(thickness: 2,),),

          Container( child:


Text("ou connecter avec QR"),

          ),
         InkWell(
           child: Container(  margin: EdgeInsets.all(20),
            child:  Icon(Icons.qr_code_scanner,size: 72,),

            ),
            onTap: () => _Scan(),),
                Container(child: Text(_data),)

               ]

               ),

            ),
            ),
            );
  }
}






