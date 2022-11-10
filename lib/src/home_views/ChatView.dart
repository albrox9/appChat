
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../custom_views/RFInputText.dart';
import '../fb_usuarios/FBText.dart';
import '../list_items/ChatItem.dart';
import '../singleton/DataHolder.dart';

class ChatView extends StatefulWidget{

  const ChatView({super.key});

  @override
  State<StatefulWidget> createState() {

    return _ChatViewState();
  }
}

class _ChatViewState extends State<ChatView>{

  FirebaseFirestore db = FirebaseFirestore.instance;
  List<FBText> chatTexts = [];
  RFInputText inputMsg=RFInputText(iLongitudPalabra: 200,);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //print("DEBUG: "+DataHolder().selectedChatRoom.name!);
    descargarTextos();
  }

  void descargarTextos() async{

    String path="${DataHolder().sCollectionRoomsName}/${DataHolder().selectedChatRoom.uid}/${DataHolder().sCollectionTextName}";

    final docRef = db.collection(path).
    withConverter(fromFirestore: FBText.fromFirestore,
        toFirestore: (FBText fbtext, _) => fbtext.toFirestore());


    docRef.snapshots().listen(
          (event) => {setState(() {
          chatTexts.clear();
          for(int i=0;i<event.docs.length;i++){
            chatTexts.add(event.docs[i].data());
          }
        })
      },
      onError: (error) => debugPrint("Listen failed: $error"),
    );


    /*
    final docSnap = await docRef.get();

    setState(() {
      for(int i=0;i<docSnap.docs.length;i++){
        chatTexts.add(docSnap.docs[i].data());
      }
    });
    */

  }

  void sendPressed()async {

    String path="${DataHolder().sCollectionRoomsName}/${DataHolder().selectedChatRoom.uid}/${DataHolder().sCollectionTextName}";

    final docRef = db.collection(path);

    FBText text = FBText(text:inputMsg.getText(),
        author: DataHolder().perfil.uid,time: Timestamp.now());

    await docRef.add(text.toFirestore());

    //descargarTextos();

  }

  void listItemShortClicked(int index){

  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: Text(DataHolder().selectedChatRoom.name!),
      ),
      //backgroundColor: Colors.orangeAccent,
      body: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.amberAccent,
                height: 400,
                child: ListView.separated(
                  padding: const EdgeInsets.all(8),
                  itemCount: chatTexts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ChatItem(sTexto: chatTexts[index].text!,
                      onShortClick: listItemShortClicked,index: index,);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                    //return RFInputText2(sTitulo: "DIVISOR DEL: "+entries[index],);
                  },
                ),
              ),
              inputMsg,
              OutlinedButton(
                onPressed: sendPressed,
                child: const Text("Send"),
              )

            ],
          )

      ),
    );
  }



}