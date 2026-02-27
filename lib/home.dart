import 'package:flutter/material.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo 03"),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }

  Widget? _body() {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Text("Linha 01", Colors.black),
          Text("Linha 02", Colors.black),
          Text("Linha 03", Colors.black)
        ],
      ),
    );
  }

  Text(String s, Color cor) {
    return Text(
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
}

