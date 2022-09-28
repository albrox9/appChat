import 'package:flutter/material.dart';
import 'package:hola_flutter/src/login-views/LoginView.dart';
import 'package:hola_flutter/src/login-views/RegisterView.dart';

import 'login-views/LoginPhoneView.dart';


class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  //En todos los Statelees.
  //No obligatorio pero recomendable.

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError(); //si no implementamos tira u error.

    return MaterialApp( //Es una plantilla.
      title: "Flutter Chat",
      initialRoute: '/loginphoneview',
      routes: {
        '/loginphoneview': (context) => const LoginPhoneView(),
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => const RegisterView(),
      }
    );
  }
}
