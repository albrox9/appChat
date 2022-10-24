import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/fb_usuarios/Room.dart';
import 'package:hola_flutter/src/list_items/RoomItem.dart';
import 'package:hola_flutter/src/singleton/DataHolder.dart';
import 'dart:async';
import '../fb_usuarios/Perfil.dart';

class HomeView extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {

    return _HomeViewState();
  }
}

class _HomeViewState extends State<HomeView> {

  FirebaseFirestore db = FirebaseFirestore.instance;
  List<Room> chatRooms = [];

  //late final User user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    actualizarLista();
  }

  /*void getProfile() async {

    String? idUser = FirebaseAuth.instance.currentUser?.uid;

    final docRef =
    db.collection('perfiles').
    doc(idUser).
    withConverter( //esto se descarga con un conversor, que lo transforma
      fromFirestore: Perfil.fromFirestore, //lo transforma en un Perfil.
      toFirestore: (Perfil perfil, _) => perfil.toFirestore(),
    );

    final docSnap = await docRef.get();
    //final perfilUsuario = docSnap.data();

    DataHolder().perfil= docSnap.data()!;


    if (DataHolder().perfil != null) {
      print(DataHolder().perfil.name);

    } else {

      print("No encuentro documento");
    }
  }*/

  void actualizarLista() async{

    final docRef =
    db.collection('rooms').
    withConverter( //esto se descarga con un conversor, que lo transforma
      fromFirestore: Room.fromFirestore, //lo transforma en un Perfil.
      toFirestore: (Room room, _) => room.toFirestore());

    final docSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        chatRooms.add(docSnap.docs[i].data());
      }
    });
  }

  void listItemShortClicked(int index){
    print("DEBUG: "+index.toString());
    print("DEBUG: "+chatRooms[index].name!);
    DataHolder().selectedChatRoom=chatRooms[index];
    Navigator.of(context).pushNamed("/ChatView");
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido' + DataHolder().perfil.name!),

      ),
      body: Center(
      child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: chatRooms.length,
          itemBuilder: (BuildContext context, int index) {
            return RoomItem(sTitulo: chatRooms[index].name!,
              onShortClick: listItemShortClicked,index: index,);
          }
      ),
      ),
    );
  }
}
