import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hola_flutter/src/fb_usuarios/Perfil.dart';
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

    await Future.delayed(const Duration(seconds: 5));

    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/loginview");
      print("------------------------------------------VOY A LOGUIN");
    }
    else{

      Fluttertoast.showToast(
          msg: "BIENVENIDO A LA APP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.cyan,
          textColor: Colors.white,
          fontSize: 16.0);

      if(checkPerfilExistance() == true){
        Navigator.of(context).popAndPushNamed("/homeview");

      }

      Navigator.of(context).popAndPushNamed("/onboarding");


      /*await DataHolder().descargarMiPerfil();

      if(DataHolder().isMiPerfilDownloaded() == true){
        Navigator.of(context).popAndPushNamed("/homeview");
        print("------------------------------------------VOY A HOMEVIEW");
      }
      else{
        Navigator.of(context).popAndPushNamed("/onboarding");
        print("------------------------------------------VOY A ONBOARFING");
      }*/
    }
  }

  Future <bool> checkPerfilExistance() async{

    final docRef= db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).
    withConverter(fromFirestore: Perfil.fromFirestore,
    toFirestore: (Perfil perfil, _) => perfil.toFirestore());

    final docSnap = await docRef.get();

    DataHolder().perfil = docSnap.data()!;

    return docSnap.exists;

  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //isUserLogged(context);
    return const Scaffold(
        body: Center(
          child:  Text("Bienvenido a Flutter Chat"),
        )
    );
  }

}