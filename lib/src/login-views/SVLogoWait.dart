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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children:  const [
              Image(image: AssetImage("assets/images/logoP.jpg"), width: 200, height: 500, ),
              CircularProgressIndicator(
                color: Colors.black38,
              ),
            ]

        )
    )
    );
  }
}
