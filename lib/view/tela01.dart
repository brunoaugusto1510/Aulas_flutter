import 'package:flutter/material.dart';
import '../widgets/botoes.dart';
import '../widgets/input.dart';
import '../widgets/meutexto.dart';

class Tela01 extends StatefulWidget {
  @override
  _Tela01State createState() => _Tela01State();
}

class _Tela01State extends State<Tela01> {
  TextEditingController c1 = TextEditingController();
  TextEditingController c2 = TextEditingController();
  TextEditingController c3 = TextEditingController();
  TextEditingController c4 = TextEditingController();
  TextEditingController c5 = TextEditingController();
  
  String res = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formatura")),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Container(width: 180, child: InputTextos("Buffet", "", controller: c1)),
                Container(width: 180, child: InputTextos("Decoração", "", controller: c2)),
              ],
            ),
            Row(
              children: [
                Container(width: 180, child: InputTextos("Entretenimento", "", controller: c3)),
                Container(width: 180, child: InputTextos("Trajes", "", controller: c4)),
              ],
            ),
            InputTextos("Convites", "", controller: c5),
            
            SizedBox(height: 30),
            
            Botoes("Somar tudo", onPressed: () {
              print("clicou");
              
              double v1 = double.parse(c1.text == "" ? "0" : c1.text);
              double v2 = double.parse(c2.text == "" ? "0" : c2.text);
              double v3 = double.parse(c3.text == "" ? "0" : c3.text);
              double v4 = double.parse(c4.text == "" ? "0" : c4.text);
              double v5 = double.parse(c5.text == "" ? "0" : c5.text);

              setState(() {
                res = "Deu: " + (v1+v2+v3+v4+v5).toString();
              });
            }),
            SizedBox(height: 20),
            MeuTexto(res, Colors.red),
          ],
        ),
      ),
    );
  }
}
