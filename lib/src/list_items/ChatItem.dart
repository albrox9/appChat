import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {

  final String sTexto;
  final Function(int index) onShortClick;
  final int index;
  final String sAuthor;

  const ChatItem({Key? key, this.sTexto="mensaje", required this.onShortClick,
    required this.index, required this.sAuthor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    /*return ListTile(
      title: Text(sTitulo),
      subtitle: Text('Secondary text'),
      leading: Icon(Icons.label),
      onTap: () {
        onShortClick(index);
      },

    );*/

    /*return Container(
      height: 100,
      child: Center(child: Text(sTexto)),
    );*/

    if(sAuthor==FirebaseAuth.instance.currentUser?.uid){
      return BubbleSpecialThree(
        text: sTexto,
        color: Colors.amberAccent.shade400,
        tail: true,
        textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 17
        ),
      );
      //return SendMessageBubble(sMessage: sTexto);
    }
    else{
      //return ReceivedMessageBubble(sMessage: sTexto);
      return BubbleSpecialThree(
        text: sTexto,
        color: Colors.blueGrey.shade100,
        tail: true,
        textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 17
        ),
        isSender: false,
      );
    }



  }


}