import 'package:flutter/material.dart';
class InputTexto extends StatelessWidget{
  String rotulo;
  String label;
  TextEditingController controller;

  InputTexto(this.rotulo, this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 20,
        color: Colors.black,
        backgroundColor: Colors.white
    ),
        decoration: InputDecoration(
          labelText: rotulo,
          hintText: label
        ),
    );
  }
}