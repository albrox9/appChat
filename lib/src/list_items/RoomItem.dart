import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomItem extends StatelessWidget {

  final String sTitulo;
  final Function(int index) onShortClick;
  final int index;//esto viene de fuera

  const RoomItem({Key? key, this.sTitulo="Titulo", required this.onShortClick,
    required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      title: Text(sTitulo),
      subtitle: Text('Secondary text'),
      leading: Icon(Icons.label),
      onTap: () {
        onShortClick(index); //la función que paso por parámetro
        //se ejecuta aquí.
      },

    );

  }

}