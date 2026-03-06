import 'package:exaula2/imagens.dart';
import 'package:flutter/material.dart';
class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tipos de Layout"),
      ),
      // body: _layoutListView(),
      body: layoutGridView(),
    );
  }

  // _layoutListView() {
  //  return ListView(
  //   children: [
  //     Text("Melhor time do mundo"),
  //     SuaImagem(caminhoArquivo: "imagens/Derac.jpg"),
  //     SuaImagem(caminhoArquivo: "imagens/ADAAng.png"),
  //     SuaImagem(caminhoArquivo: "imagens/Elosport.png"),
  //     SuaImagem(caminhoArquivo: "imagens/Guarani par.jpg"),
  //   ],
  //  );
  // }

  Widget? layoutGridView() {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
      children: [
        SuaImagem(caminhoArquivo: "imagens/ADAAng.png"),
        SuaImagem(caminhoArquivo: "imagens/Derac.jpg"),
        SuaImagem(caminhoArquivo: "imagens/Elosport.png"),
        SuaImagem(caminhoArquivo: "imagens/Guarani par.jpg"),
        SuaImagem(caminhoArquivo: "imagens/IBIS.png"),
        SuaImagem(caminhoArquivo: "imagens/OnzedeAgosto tatui.png"),
        SuaImagem(caminhoArquivo: "imagens/Santos.jpg"),
        SuaImagem(caminhoArquivo: "imagens/SaoBento.jpg"),
      ]
    );
  }
}

