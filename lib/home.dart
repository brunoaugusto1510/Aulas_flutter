import 'package:flutter/material.dart';
import 'package:exaula2/Exemplo_BarCode.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return Center(
      child: Builder(
        builder: (context) => ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const ExemploBarCode(),
              ),
            );
          },
          child: const Text('Abrir leitor bar/QR Code'),
        ),
      ),
    );
  }
}

