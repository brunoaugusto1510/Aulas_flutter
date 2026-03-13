import 'package:flutter/material.dart';
import 'package:exaula2/Widgets/InputTexto.dart';
import 'package:exaula2/Widgets/botoes.dart';

class tela01 extends StatefulWidget {
  @override
  _tela01State createState() => _tela01State();
}

class _tela01State extends State<tela01> {
  final _tValor = TextEditingController();
  final _tQuantidade = TextEditingController();
  final _tDesconto = TextEditingController();

  String _resultadoSubTotal = "0.00";
  String _resultadoDesconto = "0.00";
  String _resultadoTotal = "0.00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
            "Cálculo de Produtos", style: TextStyle(color: Colors.white)),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          InputTexto("Informe o valor do produto", "Valor do Produto", _tValor),
          InputTexto(
              "Informe a quantidade", "Quantidade do Produto", _tQuantidade),
          InputTexto(
              "Informe o desconto (%)", "Desconto do Produto", _tDesconto),
          SizedBox(height: 20),
          Botoes("Calcular", onPressed: _clickCalcular),
          SizedBox(height: 20),
          Text("Sub-total: R\$ $_resultadoSubTotal",
              style: TextStyle(fontSize: 18)),
          Text("Desconto: R\$ $_resultadoDesconto",
              style: TextStyle(fontSize: 18, color: Colors.red)),
          Text("Valor a pagar: R\$ $_resultadoTotal",
              style: TextStyle(fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.green)),
        ],
      ),
    );
  }

  void _clickCalcular() {
    double valor = double.tryParse(_tValor.text) ?? 0;
    int qtd = int.tryParse(_tQuantidade.text) ?? 0;
    double percDesconto = double.tryParse(_tDesconto.text) ?? 0;

    double subtotal = valor * qtd;
    double valorDesconto = (subtotal * percDesconto) / 100;
    double total = subtotal - valorDesconto;

    setState(() {
      _resultadoSubTotal = subtotal.toStringAsFixed(2);
      _resultadoDesconto = valorDesconto.toStringAsFixed(2);
      _resultadoTotal = total.toStringAsFixed(2);
    });
  }
}