import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key:key);

  void loginPressed(String emailAddress, String password, BuildContext context) async{

    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
     //Navigator.of(context).popAndPushNamed('/home');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    print("ME HE LOGUEADO");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    RFInputText inputUser = RFInputText(
      iLongitudPalabra:20,
      sHelperText: "Escriba su usuario",
      sTitulo: "Usuario:",
      icIzquierdo: const Icon(Icons.account_circle_outlined),
    );

    RFInputText inputPass = RFInputText(
      iLongitudPalabra:20,
      sHelperText: "Escriba su contrasenia",
      sTitulo: "Contrasenia:",
      icIzquierdo: const Icon(Icons.password),
      blIsPasswordInput: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputUser,
            inputPass,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                   loginPressed(inputUser.getText(), inputPass.getText(),context);
                  },
                  child: const Text("Login"),
                ),
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    //print("REGISTROOOOOOOO");
                    Navigator.popAndPushNamed(context, '/registerview');
                  },
                  child: const Text("Registro"),
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}