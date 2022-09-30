import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hola_flutter/src/login-views/LoginView.dart';
import 'package:hola_flutter/src/login-views/RegisterView.dart';

import 'home_views/HomeView.dart';
import 'login-views/LoginPhoneView.dart';


class App extends StatelessWidget {

  const App({Key? key}) : super(key: key);

  //En todos los Statelees.
  //No obligatorio pero recomendable.

  /*String isUserogger(){

    if(FirebaseAuth.instance.currentUser == null){
      return "/loginview";

    } else{

      return "/home";
    }
  }*/

  @override
  Widget build(BuildContext context) {

    //FirebaseAuth.instance.currentUser.

    return MaterialApp( //Es una plantilla.
      title: "Flutter Chat",
      initialRoute: '/loginview',
      routes: {
        '/home': (context)=> HomeView(),
        '/loginphoneview': (context) => const LoginPhoneView(),
        '/loginview': (context) => const LoginView(),
        '/registerview': (context) => RegisterView(),

      }
    );
  }
}
