import 'package:exaula2/exercicio1.dart';
import 'package:exaula2/exercicio2.dart';
import 'package:exaula2/exercicio3.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercícios P1"),
      ),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildCard(
            context,
            icon: Icons.celebration,
            title: 'Exercício 1',
            subtitle: 'Custo da Festa de Formatura',
            color: Colors.deepPurple,
            destination: const Exercicio1(),
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icon: Icons.directions_bus,
            title: 'Exercício 2',
            subtitle: 'Custo da Viagem de Ônibus',
            color: Colors.indigo,
            destination: const Exercicio2(),
          ),
          const SizedBox(height: 16),
          _buildCard(
            context,
            icon: Icons.work,
            title: 'Exercício 3',
            subtitle: 'Comparador de Propostas Salariais',
            color: Colors.teal,
            destination: const Exercicio3(),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required Widget destination,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: color)),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
              const Spacer(),
              Icon(Icons.arrow_forward_ios, color: color, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

