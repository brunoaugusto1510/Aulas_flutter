import 'package:flutter/material.dart';

class MeuTexto extends StatelessWidget {
  String s;
  Color cor;
  
  MeuTexto(this.s, this.cor);

  @override
  Widget build(BuildContext context) {
    return Text(
      s,
      style: TextStyle(
          color: cor,
          fontSize: 20
      ),
    );
  }
}
