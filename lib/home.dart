import 'package:exaula2/imagens.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos de Layout"),
      ),
      body: _layoutListView(),
    );
  }

  _layoutListView() {
   return ListView(
    children: [
      Text("Melhor time do mundo"),
      SuaImagem(caminhoArquivo: "imagens/Derac.jpg"),
      SuaImagem(caminhoArquivo: "imagens/ADAAng.png"),
      SuaImagem(caminhoArquivo: "imagens/Elosport.png"),
      SuaImagem(caminhoArquivo: "imagens/Guarani par.jpg"),
    ],
   );
  }
}

