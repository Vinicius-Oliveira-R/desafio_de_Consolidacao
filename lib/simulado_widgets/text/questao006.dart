
// Questão 006 — Interação e Eventos
// Descrição: Text não dispara eventos por si só; envolver em GestureDetector/InkWell para capturar toques.

/* File: lib/text/questao006.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao006App());

class TextQuestao006App extends StatelessWidget {
  const TextQuestao006App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Texto clicado'))),
            child: const Text('Clique em mim'),
          ),
        ),
      ),
    );
  }
}
