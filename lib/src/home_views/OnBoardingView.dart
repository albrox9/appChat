import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';

class OnBoardingView extends StatelessWidget {

  OnBoardingView({Key? key}) : super(key: key);

  var txt = TextEditingController();

  void btnpress(){

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

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
      blIsPasswordInput: true,
    );

    RFInputText inputCiudad = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su contrasenia",
      sTitulo: "Ciudad:",
      icIzquierdo: const Icon(Icons.password),
      blIsPasswordInput: true,
    );

    RFInputText inputEdad = RFInputText(
      iLongitudPalabra: 20,
      sHelperText: "Escriba su contrasenia",
      sTitulo: "Edad:",
      icIzquierdo: const Icon(Icons.password),
      blIsPasswordInput: true,
    );

    TextField txtMensajes = TextField(
        controller: txt, readOnly: true, style: TextStyle(
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
