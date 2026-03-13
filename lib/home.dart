import 'package:flutter/material.dart';
import 'package:exaula2/View/tela01.dart';
import 'package:exaula2/View/tela02.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Menu Inicial", style: TextStyle(color: Colors.white)),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart, color: Colors.white,
            ), onPressed: () {
              _abreTela(context, tela01());
          },
          ),
          IconButton(
            icon: Icon(
              Icons.calculate, color: Colors.white,
            ), onPressed: () {
              _abreTela(context, tela02());
          },
          )
        ],
      ),
      body: _body(),
    );
  }

  Widget? _body() {

  }

   _abreTela(context, page) {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return page;
    }));
   }
}

