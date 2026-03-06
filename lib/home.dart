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
      // body: _layoutGridView(),
      // body: _layoutContainerLinhas(),
      // body: _layoutContainerColunas(),
       body: _layoutColunasLinhas(),
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

  // _layoutGridView() {
  //   return GridView(
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 10),
  //     children: [
  //       SuaImagem(caminhoArquivo: "imagens/ADAAng.png"),
  //       SuaImagem(caminhoArquivo: "imagens/Derac.jpg"),
  //       SuaImagem(caminhoArquivo: "imagens/Elosport.png"),
  //       SuaImagem(caminhoArquivo: "imagens/Guarani par.jpg"),
  //       SuaImagem(caminhoArquivo: "imagens/IBIS.png"),
  //       SuaImagem(caminhoArquivo: "imagens/OnzedeAgosto tatui.png"),
  //       SuaImagem(caminhoArquivo: "imagens/Santos.jpg"),
  //       SuaImagem(caminhoArquivo: "imagens/SaoBento.jpg"),
  //     ]
  //   );
  // }

  // _layoutContainerLinhas() {
  //   return Container(
  //     color: Colors.white,
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         Text("Texto Exemplo"),
  //         Text("bruno")
  //       ]
  //     )
  //   );
  // }

  // _layoutContainerColunas() {
  //   return Container(
  //     color: Colors.redAccent,
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text("Texto Exemplo"),
  //         Text("bruno")
  //       ]
  //     )
  //   );
  // }

  _layoutColunasLinhas() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Texto Exemplo 1"),
              Text("bruno")
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("Texto Exemplo 2"),
              Text("bruno")
            ]
          )
        ]
      )
    );
  }
}

