import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../singleton/DataHolder.dart';

//Comprueba si está logueado.
//Si no está logueado se va al login
//Si está logueado se va al home view.
class SplashView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isUserLogged();
  }

  void isUserLogged() async{
    await Future.delayed(Duration(seconds: 2));

    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/loginview");
    }
    else{
      await DataHolder().descargarMiPerfil();
      if(DataHolder().isMiPerfilDownloaded()==true){
        Navigator.of(context).popAndPushNamed("/homeview");
      }
      else{
        Navigator.of(context).popAndPushNamed("/OnBoarding");
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //isUserLogged(context);
    return Scaffold(
        body: Center(
          child:  Text("Bienvenido a Flutter Chat"),

        )
    );
  }

}