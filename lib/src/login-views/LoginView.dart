import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';

class LoginView extends StatelessWidget {

  const LoginView({Key? key}) : super(key:key);


  void logIn(String emailAddress, String password, BuildContext context) async{

    await Future.delayed(const Duration(seconds: 1));


    try {

      final credential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(

                email: emailAddress,
                password: password,
      );


      Navigator.of(context).popAndPushNamed('/onboarding');


    } on FirebaseAuthException catch (e) {

      if (e.code == 'user-not-found') {
        debugPrint('No user found for that email.');

      } else if (e.code == 'wrong-password') {
        debugPrint('Wrong password provided for that user.');
      }
    }


  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();

    RFInputText inputUser = RFInputText(
      iLongitudPalabra:20,
      sHelperText: "Escriba su usuario",
      sTitulo: "Usuario:",
      icIzquierdo: const Icon(Icons.account_circle_outlined, color: Colors.teal,),
    );

    RFInputText inputPass = RFInputText(
      iLongitudPalabra:20,
      sHelperText: "Escriba su contrasenia",
      sTitulo: "Contrasenia:",
      icIzquierdo: const Icon(Icons.password, color: Colors.teal),
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
                   logIn(inputUser.getText(), inputPass.getText(),context);
                   //Navigator.popAndPushNamed(context, '/onboarding');
                  },
                  child: const Text("Entrar"),
                ),

                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).popAndPushNamed('/registerview');
                  },
                  child: const Text("Registrarse"),
                )
              ],

            )
          ],
        ),
      ),
    );
  }
}