
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
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 15,
      ),

      child: TextField(
      controller: _controller,
      cursorColor: Colors.blueGrey,
      cursorHeight: 15,
      //initialValue: this.sHelperText,
      maxLength: iLongitudPalabra,
      obscureText: blIsPasswordInput,
       style: const TextStyle(fontSize: 15),

        decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15.0),
        prefixIcon: icIzquierdo,
        labelText: sTitulo,
        labelStyle: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal),
        ),
        helperText: sHelperText,
        suffixIcon: icDerecho,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
      ),
      ),
    );
  }
}




