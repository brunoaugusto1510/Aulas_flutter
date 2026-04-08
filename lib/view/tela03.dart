import 'package:flutter/material.dart';
import '../widgets/botoes.dart';
import '../widgets/input.dart';
import '../widgets/meutexto.dart';

class Tela03 extends StatefulWidget {
  @override
  _Tela03State createState() => _Tela03State();
}

class _Tela03State extends State<Tela03> {
  var s1 = TextEditingController();
  var p1 = TextEditingController();
  var s2 = TextEditingController();
  var p2 = TextEditingController();
  var s3 = TextEditingController();
  var p3 = TextEditingController();

  String resultadoStr = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TI Cidades")),
      body: ListView(
        children: [
          Row(children: [ Expanded(child: InputTextos("Sal 1", "", controller: s1)), Expanded(child: InputTextos("% 1", "", controller: p1)) ]),
          Row(children: [ Expanded(child: InputTextos("Sal 2", "", controller: s2)), Expanded(child: InputTextos("% 2", "", controller: p2)) ]),
          Row(children: [ Expanded(child: InputTextos("Sal 3", "", controller: s3)), Expanded(child: InputTextos("% 3", "", controller: p3)) ]),
          
          Botoes("Testar", onPressed: () {
            double salarioItape = 1880;
            double sobraItape = salarioItape * 0.05;

            double v1 = double.parse(s1.text == "" ? "0" : s1.text);
            double pp1 = double.parse(p1.text == "" ? "0" : p1.text);
            double r1 = v1 * (pp1/100);

            double v2 = double.parse(s2.text == "" ? "0" : s2.text);
            double pp2 = double.parse(p2.text == "" ? "0" : p2.text);
            double r2 = v2 * (pp2/100);

            double v3 = double.parse(s3.text == "" ? "0" : s3.text);
            double pp3 = double.parse(p3.text == "" ? "0" : p3.text);
            double r3 = v3 * (pp3/100);

            setState(() {
              resultadoStr = "Atual: " + sobraItape.toString() + "\n" +
                             "Prop1: " + r1.toString() + "\n" +
                             "Prop2: " + r2.toString() + "\n" +
                             "Prop3: " + r3.toString();
            });
          }),
          Container(
            margin: EdgeInsets.all(10),
            child: MeuTexto(resultadoStr, Colors.blue),
          )
        ],
      ),
    );
  }
}
