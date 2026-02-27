import 'package:flutter/material.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo 02"),
        backgroundColor: Colors.blue,
      ),
      body: _body(),
    );
  }

  Widget? _body() {
    return ListView(
      children: [
        Text("Linha02"),
        Text("Linha01"),
        Text("Linha03")
      ],
    );
  }
}

