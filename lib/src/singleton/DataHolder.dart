//No visual, only data.
//Function async .

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../fb_data/FBAdmin.dart';
import '../fb_usuarios/FBText.dart';
import '../fb_usuarios/Perfil.dart';
import '../fb_usuarios/Room.dart';
import '../platform/PlatformAdmin.dart';


class DataHolder{

  static final DataHolder _dataHolder = DataHolder._internal();

  String sCollectionRoomsName = "rooms";
  String sCollectionTextName = "texts";


  String sMensaje= "";
  Perfil perfil = Perfil();
  Room selectedChatRoom = Room();//Almaceno la referencia de la Room en el DataHolder, para no perderlo al cambiar de pantalla
  FBAdmin fbAdmin = FBAdmin();

  double dSCREEN_WIDTH =0;
  double dSCREEN_HEIGHT =0;

  late PlatformAdmin platformAdmin;

  void initPlatformAdminDisplaySetting(BuildContext context){
    
    platformAdmin.initDisplayData(context);

  }

  DataHolder._internal(){

    sMensaje = "Lorem ipsum";
    platformAdmin = PlatformAdmin();

  }

  /*void initPlatformAdmin(BuildContext context){
    platformAdmin = PlatformAdmin(context);
  }*/

  factory DataHolder(){
    return _dataHolder;
  }









}

