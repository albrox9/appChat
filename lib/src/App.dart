

import 'package:flutter/material.dart';

class App extends StatelessWidget {

  const App({Key? key}) : super(key:key); //En todos los Statelees.
  //No obligatorio pero recomendable.



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   // throw UnimplementedError(); //si no implementamos tira u error.

  return MaterialApp(//Es una plantilla.
   //title: "Flutter Chat",
    home: Scaffold(
      appBar: AppBar(
        title: Text("Barra superior"),
      ),
      backgroundColor: Colors.lightGreen,
      body: Center(
        widthFactor: 20.5,
        heightFactor: 7.6,
        child: Column(
          children: [
              Text("HOLAAAAAA"),
          ],
        )
      ),
    ),
  );
  }
}
