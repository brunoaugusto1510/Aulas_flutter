import 'package:flutter/material.dart';

class Botoes extends StatelessWidget {
  final String texto;
  final void Function() onPressed;

  Botoes(this.texto, {required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.grey[300],
        backgroundColor: Colors.redAccent,
        minimumSize: const Size(88, 36),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      child: Text(texto),
      onPressed: onPressed,
    );
  }
}
