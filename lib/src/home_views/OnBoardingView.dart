import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';
import 'package:hola_flutter/src/firebase/FBAdmin.dart';

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



  void initState(){

    super.initState();
  }



  //Hace el insert de los datos del perfil.
  void btnAceptar(String nombre, String pais, String ciudad, int edad, BuildContext context) async {

    FBAdmin().insertPerfil(nombre, pais, ciudad, edad, context);

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
      icIzquierdo: const Icon(Icons.location_city_rounded),
    );

    RFInputText inputCiudad = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su ciudad",
      sTitulo: "Ciudad:",
      icIzquierdo: const Icon(Icons.location_city),
    );

    RFInputText inputEdad = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su edad",
      sTitulo: "Edad:",
      icIzquierdo: const Icon(Icons.people),
    );

    TextField txtMensajes = TextField(
        controller: txt, readOnly: true, style: const TextStyle(
        color: Colors.red, fontSize: 18));

    return Scaffold(
      appBar: AppBar(
        title: const Text('¡Completa tu perfil!'),
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
                    btnAceptar (inputNom.getText(), inputPais.getText(),
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
