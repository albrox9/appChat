import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';

import '../fb_objects/Perfil.dart';

class OnBoardingView extends StatelessWidget {

  OnBoardingView({Key? key}) : super(key: key);

  RFInputText inputNom = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: "Escriba su usuario",
    sTitulo: "Nombre:",
    icIzquierdo: const Icon(Icons.account_circle_outlined),
  );

  RFInputText inputPais = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: "Escriba su contrasenia",
    sTitulo: "Pais:",
    icIzquierdo: const Icon(Icons.password),
  );

  RFInputText inputCiudad = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: "Escriba su contrasenia",
    sTitulo: "Ciudad:",
    icIzquierdo: const Icon(Icons.password),
  );

  RFInputText inputEdad = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: "Escriba su contrasenia",
    sTitulo: "Edad:",
    icIzquierdo: const Icon(Icons.password),
  );


  var txt = TextEditingController();

  FirebaseFirestore db = FirebaseFirestore.instance;

  void btnpress() async {

    Perfil perfil =  Perfil(
        name : inputNom.getText(),
        city : inputCiudad.getText(),
        country : inputPais.getText(),
        age : int.parse(inputEdad.getText()));

    String? suid=FirebaseAuth.instance.currentUser?.uid;
  print("------------->>>>>>>>>>>> "+suid!);
    db
    //Inserte el perfil, en la coleccion perfiles, con el uid. Si hay uno igual, lo machaca. Si no, lo crea.
        .collection('perfiles')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .set(perfil.toFirestore())
        .onError((e, _) => print("Error writing document: $e"));

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    TextField txtMensajes = TextField(
        controller: txt, readOnly: true, style: const TextStyle(
        color: Colors.red, fontSize: 18));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
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
                  onPressed: btnpress,
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
