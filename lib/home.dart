import 'package:exaula2/widgets/texto.dart';
import 'package:exaula2/widgets/inputtexto.dart';
import 'package:exaula2/widgets/botoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String textoAlterado="Texto inicial";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exemplo 04"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.grey,
      child: Column(
        children: [
          Textos(textoAlterado, Colors.red),
          InputTexto("Digite seu nome", "Nome", TextEditingController()),
          Botoes("Texto do botão", onPressed: _click),
          Textos("Linha 03", Colors.yellow),
          Textos("Linha 04", Colors.deepOrange)
        ],
      ),
    );
  }

  void _click() {
    setState(() {
      textoAlterado = "Você apertou o botâo";
    });
  }
}
