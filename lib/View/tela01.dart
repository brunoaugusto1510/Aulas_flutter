import 'package:flutter/material.dart';
import 'package:exaula2/Widgets/InputTexto.dart';
import 'package:exaula2/Widgets/botoes.dart';

class tela01 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Cálculo de Produtos", style: TextStyle(color: Colors.white)),
      ),
      body: _body(),

    );
  }
}

_body() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        InputTexto("Informe o valor do produto", "Valor do Produto", TextEditingController()),
        InputTexto("Informe a quantidade", "Quantidade do Produto", TextEditingController()),
        InputTexto("Informe o desconto", "Desconto do Produto", TextEditingController()),
        Botoes("Calcular", onPressed: _clickCalcular),
      ],
    ),
  );
}

void _clickCalcular() {
  print("Calcular");
}