import 'package:flutter/material.dart';
import 'tela01.dart';
import 'tela02.dart';
import 'tela03.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          ElevatedButton(
              onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => Tela01()));}, 
              child: Text("Festa")
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => Tela02()));}, 
              child: Text("Viagem")
          ),
          SizedBox(height: 10,),
          ElevatedButton(
              onPressed:() { Navigator.push(context, MaterialPageRoute(builder: (context) => Tela03()));}, 
              child: Text("TI")
          ),
        ],
      ),
    );
  }
}
