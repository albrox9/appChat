import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/custom_views/RFInputText.dart';

class RegisterView extends StatelessWidget {

  RegisterView({Key? key}) : super(key: key);

  var txt = TextEditingController();

  void registerPressed(String emailAddress, String password, BuildContext context) async{

    try {

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
      );

      print("ME HE REGISTRADO");
      Navigator.popAndPushNamed(context, '/loginview');

    } on FirebaseAuthException catch (e) {

      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }

    } catch (e) {
      print(e);
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
      icIzquierdo: const Icon(Icons.account_circle_outlined),
    );

    RFInputText inputPass = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: "Escriba su contrasenia",
    sTitulo: "Contrasenia:",
    icIzquierdo: const Icon(Icons.password),
    blIsPasswordInput: true,
    );

    RFInputText inputPassRep = RFInputText(
    iLongitudPalabra: 20,
    sHelperText: "Escriba su contrasenia",
    sTitulo: "Repetir Contrasenia:",
    icIzquierdo: const Icon(Icons.password),
    blIsPasswordInput: true,
    );

    TextField txtMensajes = TextField(controller:txt, readOnly: true, style: TextStyle(
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
            inputUser,
            inputPass,
            inputPassRep,

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Respond to button press
                    //print("---->>>>>>>>>REGISTRO ACEPTAR");
                    //Con el if, controlamos que se repita la misma contraseña.
                    if(inputPass.getText() == inputPassRep.getText()){
                      registerPressed(inputUser.getText(), inputPass.getText(), context);
                    } else {
                      txt.text="ERROR CONTRASEÑA NO COINCIDE";
                    }
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