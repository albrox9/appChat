import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SVLogoWait extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {

    return _SVLogoWaitState();
  }
}

class _SVLogoWaitState extends State<SVLogoWait> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Center(
        child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children:  [
              Image(image: AssetImage("assets/image/img.png")),
              Text("CARGANDO APP"),
              CircularProgressIndicator(),
            ]

        )
    )
    );
  }
}
