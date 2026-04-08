import 'package:flutter/material.dart';

class Exercicio1 extends StatefulWidget {
  const Exercicio1({super.key});

  @override
  State<Exercicio1> createState() => _Exercicio1State();
}

class _Exercicio1State extends State<Exercicio1> {
  final _buffetController = TextEditingController();
  final _decoracaoController = TextEditingController();
  final _entretenimentoController = TextEditingController();
  final _trajesController = TextEditingController();
  final _formandosController = TextEditingController();
  final _convitesController = TextEditingController();
  final _lembrancasController = TextEditingController();

  double _total = 0;
  bool _calculado = false;

  void _calcular() {
    final buffet = double.tryParse(_buffetController.text.replaceAll(',', '.')) ?? 0;
    final decoracao = double.tryParse(_decoracaoController.text.replaceAll(',', '.')) ?? 0;
    final entretenimento = double.tryParse(_entretenimentoController.text.replaceAll(',', '.')) ?? 0;
    final trajes = double.tryParse(_trajesController.text.replaceAll(',', '.')) ?? 0;
    final formandos = double.tryParse(_formandosController.text.replaceAll(',', '.')) ?? 0;
    final convites = double.tryParse(_convitesController.text.replaceAll(',', '.')) ?? 0;
    final lembrancas = double.tryParse(_lembrancasController.text.replaceAll(',', '.')) ?? 0;

    setState(() {
      _total = buffet + decoracao + entretenimento + (trajes * formandos) + convites + lembrancas;
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
    _buffetController.dispose();
    _decoracaoController.dispose();
    _entretenimentoController.dispose();
    _trajesController.dispose();
    _formandosController.dispose();
    _convitesController.dispose();
    _lembrancasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Festa de Formatura'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Row(
              children: [
                Icon(Icons.celebration, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  'Serviços Contratados',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildInput('Buffet', _buffetController)),
                const SizedBox(width: 12),
                Expanded(child: _buildInput('Decoração', _decoracaoController)),
              ],
            ),
            _buildInput('Entretenimento', _entretenimentoController),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.checkroom, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  'Trajes dos Formandos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildInput('Valor por Traje', _trajesController)),
                const SizedBox(width: 12),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: TextField(
                      controller: _formandosController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Nº de Formandos',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.mail, color: Colors.deepPurple),
                SizedBox(width: 8),
                Text(
                  'Convites e Lembranças',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(child: _buildInput('Convites', _convitesController)),
                const SizedBox(width: 12),
                Expanded(child: _buildInput('Lembranças', _lembrancasController)),
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
                child: Column(
                  children: [
                    const Text(
                      'Custo Total da Festa',
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
      ),
    );
  }
}
