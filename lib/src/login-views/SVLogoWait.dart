import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/singleton/DataHolder.dart';
import '../fb_data/FBAdmin.dart';

class SVLogoWait extends StatefulWidget{
  final String sLogoPath;

  const SVLogoWait(this.sLogoPath, {super.key});


  @override
  State<StatefulWidget> createState() {

    return _SVLogoWaitState();
  }
}

class _SVLogoWaitState extends State<SVLogoWait> {

  //LLAMADA A UNA FUNCIÓN DEL ESTADO INICIAL.
  //NOS PERMITE DEFINIR EL ESTADO INICIAL DE NUESTRA PANTALLA
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   FirebaseAuth.instance.signOut();
    loadAllData();
  }



  void loadAllData() async{
    //Función en la que vamos a cargar todos los recursos necesarios (aunque hay cosas que se cargan antes)
    await Future.delayed(const Duration(seconds: 2));

    if(FirebaseAuth.instance.currentUser == null){

      setState(() {
        Navigator.of(context).popAndPushNamed("/loginview");
      });

    }
    else {

      bool existe = await FBAdmin().descargarPerfil();

      if(existe){

        setState(() {
          Navigator.of(context).popAndPushNamed("/homeview");
        });

      } else{

        setState(() {
          Navigator.of(context).popAndPushNamed("/onboarding");
        });

      }



    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    DataHolder().platformAdmin.initDisplayData(context);
    print("DEBUG: LA PLATAFORMA TIENE UNA ALTURA ${DataHolder().platformAdmin.dSCREEN_HEIGHT}");

    //Esto solo funciona dentro de un material app

    return Scaffold(
        body: Center(
        child: Column (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(image: AssetImage(widget.sLogoPath), width: 250, height: 200, ),
              const Text("Respire...",
              style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 23,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold)
              ),
              const CircularProgressIndicator(
                color: Colors.teal,
              ),
            ]

        )
    )
    );
  }
}
