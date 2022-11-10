import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eurekalib/grid_views/RoomCard.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/fb_usuarios/Room.dart';
import 'package:hola_flutter/src/singleton/DataHolder.dart';

class HomeView extends StatefulWidget{

  const HomeView({super.key});

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

    //String Query = SELECT * FROM ROOMS WHERE MEMBERS > 100
    //podemos agregar condiciones las que queramos, splo añadiendolas con comas. También podemos agregar el order by y más cosas.
    final docRef =
    db.collection('rooms').//where("members",isGreaterThan: 100).
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
//Esta es la function que le pasaremos a la roomItem
  void listItemShortClicked(int index){
    //print("DEBUG: "+index.toString()); //nos saldrá e logcat
    //print("DEBUG: "+chatRooms[index].name!); //imprime el nombre de la room referenciada en el index
    DataHolder().selectedChatRoom=chatRooms[index];//Recupero la referencia de la Room del data Holder, que se guarda en el perfil.
    Navigator.of(context).pushNamed("/chatview");//Sin el pop se agrega la pantalla por encima, y puedo volver atrás.
  }



  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido${DataHolder().perfil.name!}'),

      ),
      body: Center(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3
          ),
          itemCount: chatRooms.length,
          itemBuilder: (BuildContext context, int index){
            return RoomCard(
                    sImgURL: chatRooms[index].image!,
                    sName: chatRooms[index].name!,
                    onShortClick: listItemShortClicked,
                    index: index);
             }
          /*ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: chatRooms.length,
          itemBuilder: (BuildContext context, int index) {
            return RoomItem(sTitulo: chatRooms[index].name!,
              onShortClick: listItemShortClicked,index: index,);}
        ),*/

        )
      ),
    );
  }
}
