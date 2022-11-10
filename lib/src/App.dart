import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hola_flutter/src/home_views/ChatView.dart';


import 'home_views/HomeView.dart';
import 'home_views/OnBoardingView.dart';
import 'login-views/LoginView.dart';
import 'login-views/RegisterView.dart';
import 'login-views/SVLogoWait.dart';


class App extends StatelessWidget{

  App({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "La Casa del Aire",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),

      initialRoute: '/splashview',
      routes: {
        '/loginview':(context) => LoginView(),
        '/registerview':(context) => RegisterView(),
        '/homeview':(context) => HomeView(),
        '/onboarding':(context) => OnBoardingView(),
        '/splashview':(context)=> SVLogoWait(),
        '/chatview':(context)=> ChatView(),
      },
    );
  }

}