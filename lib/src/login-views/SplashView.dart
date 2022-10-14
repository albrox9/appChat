import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../fb_objects/Perfil.dart';

class SplashView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _SplashViewState();
  }
}

class _SplashViewState extends State<SplashView> {
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  void initState() {//Es el primer metodo que se hará cuando habra la aplicación
    // TODO: implement initState
    super.initState();
    print("ENTRE EN 1");
    isUserLogged();
    print("ENTRE EN 3");

  }

  void isUserLogged() async{
    await Future.delayed(Duration(seconds: 5)); //Esta linea hace que se espere el programa 5 ss para que al programa le de tiempo
    //a ejecutarse. si no puede fallar, y que no pueda cargar las pantallas a las que tiene que saltar.

    if(FirebaseAuth.instance.currentUser==null){
      Navigator.of(context).popAndPushNamed("/loginview");
    }
    else{
      if( await checkPerfilExistance()==true){
        Navigator.of(context).popAndPushNamed("/homeview");
      }
      else{
        Navigator.of(context).popAndPushNamed("/onboarding");
      }
    }
  }

  Future<bool> checkPerfilExistance() async {
    final docRef = db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid)
        .withConverter(fromFirestore: Perfil.fromFirestore,
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );

    final docSnap = await docRef.get();
    return docSnap.exists;

    if(docSnap.exists==true){
      return true;
    }
    else{
      return false;
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