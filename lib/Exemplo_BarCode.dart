import 'dart:io';

import 'package:cross_file/cross_file.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picture_taker/flutter_picture_taker.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class ExemploBarCode extends StatefulWidget {
  const ExemploBarCode({super.key});

  @override
  State<ExemploBarCode> createState() => _ExemploBarCodeState();
}

class _ExemploBarCodeState extends State<ExemploBarCode> {
  String codigoLido = '0000';
  XFile? _image;

  Future<void> _lerQrCode() async {
    try {
      final resultado = await SimpleBarcodeScanner.scanBarcode(context);

      if (resultado is String && mounted) {
        setState(() {
          codigoLido = resultado;
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        codigoLido = 'Erro ao ler codigo';
      });
    }
  }

  Future<void> _takePicture() async {
    try {
      final image = await showStillCameraDialog(context);
      if (image != null && mounted) {
        setState(() {
          _image = image;
        });
      }
    } catch (_) {
    }
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: _lerQrCode,
            child: const Text('Ler QR/BarCode'),
          ),
          const SizedBox(height: 12),
          Text('Codigo lido: $codigoLido'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _takePicture,
            child: const Text('Tira foto'),
          ),
          const SizedBox(height: 12),
          if (_image != null)
            Expanded(
              child: kIsWeb
                  ? Image.network(_image!.path, fit: BoxFit.contain)
                  : Image.file(File(_image!.path), fit: BoxFit.contain),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo bar/QrCode'),
      ),
      body: _body(),
    );
  }
}

