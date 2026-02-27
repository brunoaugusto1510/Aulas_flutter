import 'package:flutter/material.dart';
class Text extends StatelessWidget {
  String s;
  Color cor;
  Text(this.s, this.cor);

  @override
  Widget build(BuildContext context) {
    return
      Text(
      s,
      style: TextStyle(
        color: cor,
        backgroundColor: Colors.grey,
        fontSize: 20,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  Text(this.s, this.cor);

}