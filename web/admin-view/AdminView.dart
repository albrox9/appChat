import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/singleton/DataHolder.dart';

class AdminView  extends StatelessWidget{

  const AdminView({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (const Icon(Icons.star)),
            color: Colors.red[500],
            onPressed: () {  },
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: const Text("Hola esta pagina es de prueba"),
          ),
        ),
      ],
    );
  }
}
