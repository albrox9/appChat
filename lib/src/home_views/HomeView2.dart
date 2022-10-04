import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../fb_objects/Perfil.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  //late final User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

    void getProfile() async {

    final ref =
    db.collection('perfiles').
    doc(FirebaseAuth.instance.currentUser?.uid).
    withConverter( //esto se descarga con un conversor, que lo transforma
      fromFirestore: Perfil.fromFirestore, //lo transforma en un Perfil.
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );

    final docSnap = await ref.get();

    //final usuario = docSnapshot.data();//Paso intermedio. Investigar el data.
    final perfil = docSnap.data();

    if (perfil != null) {

      print(perfil.name!);

    } throw {
      print("No encuentro documento"),
    };
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text('Chatdar'),
        ),
        //backgroundColor: Colors.orangeAccent,
        body: const Center(

        )
      );

  }
}
