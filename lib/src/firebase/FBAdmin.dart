import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../fb_usuarios/Perfil.dart';
import '../singleton/DataHolder.dart';

class FBAdmin{

  FirebaseFirestore db = FirebaseFirestore.instance;

  //INSERT DESDE EL ONBOARDING DE LOS DATOS DEL USUARIO RECOGIDOS.
  void insertPerfil(String nombre, String pais, String ciudad, int edad, BuildContext context) async {

    Perfil perfil = Perfil(name: nombre, country: pais, city: ciudad, age: edad);

    await db.collection("perfiles").doc(FirebaseAuth.instance.currentUser?.uid).
    set(perfil.toFirestore()).
    onError((e, _) => print("Error writing document: $e"));

    Navigator.of(context).popAndPushNamed("/homeview");
  }

  //DESCARGA DEL PERFIL DE USUARIO EN EL SPLASH VIEW PARA COMPROBAR SI EXISTE PERFIL
  Future <bool> descargarPerfil() async {

    String? idUser = FirebaseAuth.instance.currentUser?.uid;

    final docRef = db.collection("perfiles").doc(idUser)
        .withConverter(fromFirestore: Perfil.fromFirestore,
        toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );

    DocumentSnapshot docsnap = await docRef.get();
    return docsnap.exists;

  }


}