import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Interpreter _interpreter;
  String _status = 'Carregando modelo...';

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  Future<void> _loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset('kmeans_model.tflite');
      setState(() {
        _status = 'Modelo carregado com sucesso!';
      });
    } catch (e) {
      setState(() {
        _status = 'Erro ao carregar o modelo: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Teste do TensorFlow Lite'),
        ),
        body: Center(
          child: Text(_status),
        ),
      ),
    );
  }
}
