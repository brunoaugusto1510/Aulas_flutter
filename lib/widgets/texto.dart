import 'package:flutter/material.dart';
class Textos extends StatelessWidget {
  String s;
  Color cor;
  Textos(this.s, this.cor);

  @override
  Widget build(BuildContext context) {
    return

      Text(
        s,
        style: TextStyle(
            color: cor,
            backgroundColor: Colors.cyanAccent,
            fontSize: 33
        ),
      );
  }
}