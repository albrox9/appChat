import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hola_flutter/src/login-views/SplashView.dart';

import 'home_views/HomeView2.dart';
import 'home_views/OnBoardingView.dart';
import 'login-views/LoginView.dart';
import 'login-views/RegisterView.dart';


class App extends StatelessWidget{

  App({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/splashview',
      routes: {
        '/loginview':(context) => LoginView(),
        '/registerview':(context) => RegisterView(),
        '/homeview':(context) => HomeView(),
        '/onboarding':(context) => OnBoardingView(),
        '/splashview':(context)=> SplashView(),
      },
    );
  }

}