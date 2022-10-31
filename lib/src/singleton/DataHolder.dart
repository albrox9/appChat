//El Data holder, no va a tener nada visual.
//Funciones que permitan realizar funciones asyncronas puras y duras.

import 'package:firebase_auth/firebase_auth.dart';
import '../fb_usuarios/Perfil.dart';
import '../fb_usuarios/Room.dart';
import '../firebase/FBAdmin.dart';

class DataHolder{

  static final DataHolder _dataHolder = new DataHolder._internal();

  String sCOLLECTIONS_ROOMS_NAME = "rooms";
  String sCOLLECTIONS_TEXTS_NAME = "texts";

  String sMensaje= "";
  Perfil perfil = Perfil();
  Room selectedChatRoom = Room();//Almaceno la referencia de la Room en el DataHolder, para no perderlo al cambiar de pantalla
  FBAdmin fbAdmin = FBAdmin();

  DataHolder._internal(){
    sMensaje = "Lorem ipsum";
  }

  factory DataHolder(){
    return _dataHolder;
  }

  Future<void> descargarMiPerfil() async {

    await fbAdmin.descargarPerfil(FirebaseAuth.instance.currentUser?.uid) as Perfil;

  }

  Future<void> descargarPerfilGenerico(String? idPerfil) async{
    await fbAdmin.descargarPerfil(idPerfil) as Perfil;
  }

  bool isMiPerfilDownloaded(){
    perfil = descargarMiPerfil() as Perfil;
    return perfil != null;
  }

}

