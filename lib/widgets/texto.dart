import 'package:flutter/material.dart';
class Textos extends StatelessWidget {
  String s;
  Textos(this.s);

  @override
  Widget build(BuildContext context) {
    return

      Text(
        s,
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
            color: Colors.black
        ),
      );
  }
}