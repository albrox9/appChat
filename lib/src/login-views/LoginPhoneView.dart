import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../custom_views/RFInputText.dart';

class LoginPhoneView extends StatefulWidget{

  const LoginPhoneView({super.key});


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LoginPhoneViewState();
  }

}

class _LoginPhoneViewState extends State<LoginPhoneView>{

  RFInputText inputTextPhone = RFInputText(sTitulo: "Numero Telefono",);
  RFInputText inputTextCode = RFInputText(sTitulo: "Codigo verificacion",);

  bool blIsWaitngForSMS = false;
  late String verificationId;

  void enviarTelefono(String phoneNumber, BuildContext context ) async {

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,

      verificationCompleted: (PhoneAuthCredential credential) async {
       await FirebaseAuth.instance.signInWithCredential(credential);
       print("Me he logueado");
        //Navigator.popAndPushNamed(context, '/home');

      },

      verificationFailed: (FirebaseAuthException e) {

      },

      codeSent: (String verificationId, int? resendToken) {
        this.verificationId = verificationId;
        setState(() {
          blIsWaitngForSMS=true;
        });

      },

      codeAutoRetrievalTimeout: (String verificationId) {

      },
    );
  }

  void enviarCodigo(String smsCode, BuildContext context ) async{

    PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
    await FirebaseAuth.instance.signInWithCredential(credential);
    print("Me he logueado");
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            inputTextPhone,
            OutlinedButton(
              onPressed: (){
                enviarTelefono(inputTextPhone.getText(), context);
                },
              child: const Text("Phone Login"),
            ),
            if(blIsWaitngForSMS)
              inputTextCode,
            if(blIsWaitngForSMS)
              OutlinedButton(
              onPressed: (){
                enviarCodigo(inputTextCode.getText(), context);
              },
              child: const Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}