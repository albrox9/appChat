import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hola_flutter/src/home_views/ChatView.dart';
import 'package:hola_flutter/src/singleton/DataHolder.dart';


import 'home_views/HomeView.dart';
import 'home_views/OnBoardingView.dart';
import 'login-views/LoginView.dart';
import 'login-views/RegisterView.dart';
import 'login-views/SVLogoWait.dart';


class App extends StatelessWidget{

  const App({Key? key}) : super(key:key);


  @override
  Widget build(BuildContext context) {


    //DataHolder().dSCREEN_WIDTH= MediaQuery.of(context).size.width;
    MaterialApp materialAppMobile=const MaterialApp();
    //DataHolder().platformAdmin.initDisplayData(context);
    if(DataHolder().platformAdmin.isAndroidPlatform() ||
        DataHolder().platformAdmin.isIOSPlatform()){

      materialAppMobile=MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal
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
    else if(DataHolder().platformAdmin.isWebPlatform()){

      materialAppMobile=MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange
        ),
        initialRoute: '/homeview',
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

  //print("DEBUG: LA PLATAFORMA TIENE UNA ALTURA" + DataHolder().platformAdmin.dSCREEN_HEIGHT.toString());

    return materialAppMobile;
  }

}

