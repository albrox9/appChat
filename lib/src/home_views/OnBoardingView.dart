import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';

import '../fb_usuarios/Perfil.dart';
import '../singleton/DataHolder.dart';

class OnBoardingView extends StatefulWidget {

  const OnBoardingView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _OnBoardingView();
  }
}
  
class _OnBoardingView extends State<OnBoardingView>{


  var txt = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void initState(){

    super.initState();
    DataHolder().sMensaje="HOLA DESDE ONBOARDING";

    checkExistingProfile();

  }

  void checkExistingProfile() async{

    String? idUser=FirebaseAuth.instance.currentUser?.uid;

    final docRef = db.collection("perfiles").doc(idUser);

    DocumentSnapshot docsnap= await docRef.get();

    if(docsnap.exists){
      Navigator.of(context).popAndPushNamed("/homeview");
    }
    //DataHolder().pruebaFuncion();
  }

  void btnpress(String nombre, String pais, String ciudad, int edad, BuildContext context) async {

    Perfil perfil = Perfil(name: nombre, country: pais, city: ciudad, age: edad);

    await db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).
    set(perfil.toFirestore()).
    onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/homeview");

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    RFInputText inputNom = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su nombre",
      sTitulo: "Nombre:",
      icIzquierdo: const Icon(Icons.account_circle_outlined),
    );

    RFInputText inputPais = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su pais",
      sTitulo: "Pais:",
      icIzquierdo: const Icon(Icons.password),
    );

    RFInputText inputCiudad = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su ciudad",
      sTitulo: "Ciudad:",
      icIzquierdo: const Icon(Icons.password),
    );

    RFInputText inputEdad = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su edad",
      sTitulo: "Edad:",
      icIzquierdo: const Icon(Icons.password),
    );

    TextField txtMensajes = TextField(
        controller: txt, readOnly: true, style: const TextStyle(
        color: Colors.red, fontSize: 18));

    return Scaffold(
      appBar: AppBar(
        title: const Text('BIENVENIDO'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputNom,
            inputPais,
            inputCiudad,
            inputEdad,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    btnpress (inputNom.getText(), inputPais.getText(),
                    inputCiudad.getText(), int.parse(inputEdad.getText()), context);
                    },
                  child: const Text("ACEPTAR"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    Navigator.popAndPushNamed(context, '/loginview');
                  },
                  child: const Text("CANCELAR"),
                )
              ],
            ),
            txtMensajes,
          ],
        ),
      ),
    );
  }

}
