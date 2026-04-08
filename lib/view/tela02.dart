import 'package:flutter/material.dart';
import '../widgets/botoes.dart';
import '../widgets/input.dart';
import '../widgets/meutexto.dart';

class Tela02 extends StatefulWidget {
  @override
  _Tela02State createState() => _Tela02State();
}

class _Tela02State extends State<Tela02> {
  var t1 = TextEditingController();
  var t2 = TextEditingController();
  var t3 = TextEditingController();
  var t4 = TextEditingController();
  
  String txtFinal = "Calcula ai";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Onibus")),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                InputTextos("Passagens", "", controller: t1),
                InputTextos("Taxas", "", controller: t2),
                InputTextos("Comida", "", controller: t3),
                InputTextos("Hotel", "", controller: t4),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.yellow,
              child: Column(
                children: [
                  Botoes("Vai", onPressed: () {
                    try {
                      double soma = double.parse(t1.text) + double.parse(t2.text) + double.parse(t3.text) + double.parse(t4.text);
                      setState(() {
                        txtFinal = "R\$ " + soma.toString();
                      });
                    } catch(e) {
                      setState(() { txtFinal = "Erro digite tudo"; });
                    }
                  }),
                  MeuTexto(txtFinal, Colors.black),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
