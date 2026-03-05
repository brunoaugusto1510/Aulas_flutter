import 'package:exaula2/widgets/texto.dart';
import 'package:exaula2/widgets/inputtexto.dart';
import 'package:exaula2/widgets/botoes.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _tNome = TextEditingController();
  final _tP1 = TextEditingController();
  final _tProjeto = TextEditingController();
  final _tLista = TextEditingController();

  String _resultado = "";

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
          InputTexto("Nota das listas", "lista", _tLista),
          const SizedBox(height: 20),
          Botoes("Calcular Média", onPressed: _click),
          const SizedBox(height: 20),
          Textos(_resultado),
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

      double media = (p1 + projeto + lista) / 3;

      String situacao = media >= 6 ? "aprovado" : "reprovado";

      _resultado = "O aluno $nome foi $situacao com média: ${media.toStringAsFixed(2)}";
    });
  }
}