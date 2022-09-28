
import 'package:flutter/material.dart';

class RFInputText extends StatelessWidget{

  final int iLongitudPalabra;
  final String sValorInicial;
  final String sHelperText;
  final String sTitulo;
  final Icon icIzquierdo;
  final Icon icDerecho;
  final bool blIsPasswordInput;


    RFInputText ({Key? key,
      this.iLongitudPalabra = 20,
      this.sValorInicial = "",
      this.sHelperText = "",
      this.sTitulo="",
      this.icIzquierdo = const Icon(Icons.favorite),
      this.icDerecho = const Icon(Icons.check_circle),
      this.blIsPasswordInput = false,
  }) : super (key:key);

  final TextEditingController _controller= TextEditingController();

  String getText(){
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return TextFormField(
      controller: _controller,
      cursorColor: Colors.purple,
      //initialValue: this.sHelperText,
      maxLength: iLongitudPalabra,
      obscureText: blIsPasswordInput,
      decoration: InputDecoration(
        icon: icIzquierdo,
        labelText: sTitulo,
        labelStyle: const TextStyle(
          color: Color(0xFF6200EE),
        ),
        helperText: sHelperText,
        suffixIcon: icDerecho,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF6200EE)),
        ),
      ),
    );
  }
}




