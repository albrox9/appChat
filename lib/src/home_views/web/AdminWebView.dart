import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdminWebView extends StatelessWidget {
  const AdminWebView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (const Icon(Icons.star)),
            color: Colors.red[500],
            onPressed: () {  },
          ),
        ),
        SizedBox(
          width: 18,
          child: Container(
            child: const Text('Esto es una clase de prueba para web'),
          ),
        ),
      ],
    );
  }
}