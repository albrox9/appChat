import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import '../custom_usuarios/Users.dart';

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

    Future <Users?> getProfile() async {

    final docRef =
      db.collection('perfiles').
      doc(FirebaseAuth.instance.currentUser?.uid).
      withConverter(
      fromFirestore: Users.fromFirestore,
      toFirestore: (Users usuario, _) => usuario.toFirestore(),
    );

    final docSnapshot = await docRef.get();

    //final usuario = docSnapshot.data();//Paso intermedio. Investigar el data.

    if (docSnapshot.data() != null) {

      return docSnapshot.data();

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
      body: Center(
        child: FutureBuilder<Users?>(
          future: getProfile(),
          builder: (BuildContext context,AsyncSnapshot snapshot) {

            if(snapshot.connectionState == ConnectionState.waiting){
              return const Center(
                child:
                CircularProgressIndicator(),
              );
            }
            return Center(
              child: Column(
                children: [
                  Text('${snapshot.data?.name}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigoAccent )),
                  Text('${snapshot.data?.age}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigoAccent )),
                  Text('${snapshot.data?.city}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigoAccent )),
                  Text('${snapshot.data?.country}', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.indigoAccent )),
                ],
              )
                );
              },
            ),
          )
        );
  }
}
