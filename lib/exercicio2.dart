import 'package:flutter/material.dart';

class Exercicio2 extends StatefulWidget {
  const Exercicio2({super.key});

  @override
  State<Exercicio2> createState() => _Exercicio2State();
}

class _Exercicio2State extends State<Exercicio2> {
  final _passagem1Controller = TextEditingController();
  final _passagem2Controller = TextEditingController();
  final _passagem3Controller = TextEditingController();
  final _taxaEmbarqueController = TextEditingController();
  final _alimentacaoController = TextEditingController();
  final _hospedagemController = TextEditingController();

  double _total = 0;
  bool _calculado = false;

  void _calcular() {
    final passagem1 = double.tryParse(_passagem1Controller.text.replaceAll(',', '.')) ?? 0;
    final passagem2 = double.tryParse(_passagem2Controller.text.replaceAll(',', '.')) ?? 0;
    final passagem3 = double.tryParse(_passagem3Controller.text.replaceAll(',', '.')) ?? 0;
    final taxaEmbarque = double.tryParse(_taxaEmbarqueController.text.replaceAll(',', '.')) ?? 0;
    final alimentacao = double.tryParse(_alimentacaoController.text.replaceAll(',', '.')) ?? 0;
    final hospedagem = double.tryParse(_hospedagemController.text.replaceAll(',', '.')) ?? 0;

    setState(() {
      _total = passagem1 + passagem2 + passagem3 + taxaEmbarque + alimentacao + hospedagem;
      _calculado = true;
    });
  }

  Widget _buildInput(String label, TextEditingController controller) {
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

  @override
  void dispose() {
    _passagem1Controller.dispose();
    _passagem2Controller.dispose();
    _passagem3Controller.dispose();
    _taxaEmbarqueController.dispose();
    _alimentacaoController.dispose();
    _hospedagemController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Viagem de Ônibus'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flex(
              direction: Axis.vertical,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    const Icon(Icons.directions_bus, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    const Text(
                      'Passagens por Trecho',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: _buildInput('Trecho 1', _passagem1Controller)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildInput('Trecho 2', _passagem2Controller)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildInput('Trecho 3', _passagem3Controller)),
                  ],
                ),
                const SizedBox(height: 16),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    const Icon(Icons.receipt_long, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    const Text(
                      'Taxas e Custos Adicionais',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: _buildInput('Taxa de Embarque', _taxaEmbarqueController)),
                  ],
                ),
                const SizedBox(height: 16),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    const Icon(Icons.hotel, color: Colors.deepPurple),
                    const SizedBox(width: 8),
                    const Text(
                      'Alimentação e Hospedagem',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(child: _buildInput('Alimentação', _alimentacaoController)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildInput('Hospedagem', _hospedagemController)),
                  ],
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Calcular Custo Total', style: TextStyle(fontSize: 16)),
                ),
                if (_calculado) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.deepPurple),
                    ),
                    child: Flex(
                      direction: Axis.vertical,
                      children: [
                        const Text(
                          'Custo Total da Viagem',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'R\$ ${_total.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
