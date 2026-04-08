import 'package:flutter/material.dart';

class Exercicio3 extends StatefulWidget {
  const Exercicio3({super.key});

  @override
  State<Exercicio3> createState() => _Exercicio3State();
}

class _Exercicio3State extends State<Exercicio3> {
  final _salarioAtualController = TextEditingController();
  final _proposta1Controller = TextEditingController();
  final _percentual1Controller = TextEditingController();
  final _proposta2Controller = TextEditingController();
  final _percentual2Controller = TextEditingController();
  final _proposta3Controller = TextEditingController();
  final _percentual3Controller = TextEditingController();

  double? _sobraAtual;
  double? _sobra1;
  double? _sobra2;
  double? _sobra3;
  bool _calculado = false;

  void _calcular() {
    final salarioAtual = double.tryParse(_salarioAtualController.text.replaceAll(',', '.')) ?? 0;
    final proposta1 = double.tryParse(_proposta1Controller.text.replaceAll(',', '.')) ?? 0;
    final percentual1 = double.tryParse(_percentual1Controller.text.replaceAll(',', '.')) ?? 0;
    final proposta2 = double.tryParse(_proposta2Controller.text.replaceAll(',', '.')) ?? 0;
    final percentual2 = double.tryParse(_percentual2Controller.text.replaceAll(',', '.')) ?? 0;
    final proposta3 = double.tryParse(_proposta3Controller.text.replaceAll(',', '.')) ?? 0;
    final percentual3 = double.tryParse(_percentual3Controller.text.replaceAll(',', '.')) ?? 0;

    setState(() {
      _sobraAtual = salarioAtual * 0.05;
      _sobra1 = proposta1 * (percentual1 / 100);
      _sobra2 = proposta2 * (percentual2 / 100);
      _sobra3 = proposta3 * (percentual3 / 100);
      _calculado = true;
    });
  }

  Widget _buildSalarioInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          prefixText: 'R\$ ',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildPercentualInput(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          suffixText: '%',
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildResultRow(String label, double? valor, Color cor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: cor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: cor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
          Text(
            'R\$ ${valor?.toStringAsFixed(2) ?? '0.00'}',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: cor),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _salarioAtualController.dispose();
    _proposta1Controller.dispose();
    _percentual1Controller.dispose();
    _proposta2Controller.dispose();
    _percentual2Controller.dispose();
    _proposta3Controller.dispose();
    _percentual3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparador de Propostas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Icon(Icons.work, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  'Emprego Atual',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            const Text(
              'Sobra fixa de 5% do salário atual',
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 8),
            _buildSalarioInput('Salário Atual', _salarioAtualController),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.location_city, color: Colors.blue),
                SizedBox(width: 8),
                Text(
                  'Proposta 1',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildSalarioInput('Salário Proposta 1', _proposta1Controller)),
                const SizedBox(width: 12),
                Expanded(child: _buildPercentualInput('% de Sobra', _percentual1Controller)),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.location_city, color: Colors.green),
                SizedBox(width: 8),
                Text(
                  'Proposta 2',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildSalarioInput('Salário Proposta 2', _proposta2Controller)),
                const SizedBox(width: 12),
                Expanded(child: _buildPercentualInput('% de Sobra', _percentual2Controller)),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.location_city, color: Colors.orange),
                SizedBox(width: 8),
                Text(
                  'Proposta 3',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildSalarioInput('Salário Proposta 3', _proposta3Controller)),
                const SizedBox(width: 12),
                Expanded(child: _buildPercentualInput('% de Sobra', _percentual3Controller)),
              ],
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Calcular', style: TextStyle(fontSize: 16)),
            ),
            if (_calculado) ...[
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(Icons.savings, color: Colors.deepPurple),
                  SizedBox(width: 8),
                  Text(
                    'Resultado – O que sobra para você',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildResultRow('Emprego Atual', _sobraAtual, Colors.deepPurple),
              _buildResultRow('Proposta 1', _sobra1, Colors.blue),
              _buildResultRow('Proposta 2', _sobra2, Colors.green),
              _buildResultRow('Proposta 3', _sobra3, Colors.orange),
            ],
          ],
        ),
      ),
    );
  }
}
