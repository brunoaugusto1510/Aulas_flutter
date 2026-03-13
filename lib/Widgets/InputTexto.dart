import 'package:flutter/material.dart';

class InputTexto extends StatelessWidget{
  String rotulo;
  String label;
  TextEditingController controller;

  InputTexto(this.rotulo, this.label, this.controller);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
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