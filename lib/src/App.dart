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
   // DataHolder().initPlatformAdmin(context);
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
          '/loginview':(context) => const LoginView(),
          '/registerview':(context) => RegisterView(),
          '/homeview':(context) => const HomeView(),
          '/onboarding':(context) => const OnBoardingView(),
          '/splashview':(context)=> const SVLogoWait("assets/android/images/logo.jpg"),
          '/chatview':(context)=> const ChatView(),
        },
      );
    }
    else if(DataHolder().platformAdmin.isWebPlatform()){

      materialAppMobile=MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange
        ),
        initialRoute: '/splashview',
        routes: {
          '/loginview':(context) => const LoginView(),
          '/registerview':(context) => RegisterView(),
          '/homeview':(context) => const HomeView(),
          '/onboarding':(context) => const OnBoardingView(),
          '/splashview':(context)=> const SVLogoWait("assets/web/images/logo.jpg"),
          '/chatview':(context)=> const ChatView(),
        },
      );
    }


    return materialAppMobile;
  }

}

