import 'package:flutter/material.dart';

class Textos extends StatelessWidget {
  final String s;
  final Color cor;

  Textos(this.s, {this.cor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Text(
      s,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: cor,
      ),
    );
  }
}
