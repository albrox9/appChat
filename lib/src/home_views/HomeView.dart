

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {

  const HomeView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView>{

  /*FirebaseFirestore db = FirebaseFirestore.instance; //db, es database. Crea un objeto Firebase.

    void initState(){
      super.initState();
      getprofile();

    }

    void getprofile() async{
      //Acceder a los datos del perfil del firebase.
      //esto devuelve todas las filas. Select *
      //Queremos uno concreto.
      await db.collection("perfiles").doc("A4xLAZazX3Otxcx40FJoXKul6Dk2").get().then(
              (DocumentSnapshot doc) {
          final data = doc.data() as Map <String, dynamic>;
          print("------------->>>>>>>>>>" + data.toString());

      },
        onError: (e) => print("Error getting document: $e"),
      );

    }*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOME'),
      ),
      backgroundColor: Colors.tealAccent,
      body: Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
            Text("Home view"),
          ],
        ),
      ),
    );
  }
}



