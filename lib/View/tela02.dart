import 'package:exaula2/widgets/texto.dart';
import 'package:exaula2/widgets/inputtexto.dart';
import 'package:exaula2/widgets/botoes.dart';
import 'package:flutter/material.dart';

class tela02 extends StatefulWidget {
  @override
  State<tela02> createState() => _tela02State();
}

class _tela02State extends State<tela02> {
  final _tNome = TextEditingController();
  final _tP1 = TextEditingController();
  final _tProjeto = TextEditingController();
  final _tLista = TextEditingController();

  String _resultado = "";
  Color _corResultado = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo da Média"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InputTexto("Digite seu nome", "Nome", _tNome),
          InputTexto("Nota da p1", "p1", _tP1),
          InputTexto("Nota do projeto", "projeto", _tProjeto),
          InputTexto("Nota das listas (máx 2)", "lista", _tLista),
          const SizedBox(height: 20),
          Botoes("Calcular Média", onPressed: _click),
          const SizedBox(height: 20),
          Textos(_resultado, cor: _corResultado),
        ],
      ),
    );
  }

  void _click() {
    setState(() {
      String nome = _tNome.text;

      double p1 = double.tryParse(_tP1.text) ?? 0;
      double projeto = double.tryParse(_tProjeto.text) ?? 0;
      double lista = double.tryParse(_tLista.text) ?? 0;

      if (lista > 2) lista = 2;

      double media = (projeto * 0.5) + (p1 * 0.3) + lista;

      if (media >= 6) {
        _resultado = "O aluno $nome foi aprovado com média: ${media.toStringAsFixed(2)}";
        _corResultado = Colors.blue;
      } else {
        _resultado = "O aluno $nome foi reprovado com média: ${media.toStringAsFixed(2)}";
        _corResultado = Colors.red;
      }
    });
  }
}