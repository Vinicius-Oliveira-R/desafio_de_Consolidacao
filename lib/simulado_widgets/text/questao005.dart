// Questão 005 — Estilo e Personalização
// Descrição: alterar aparência via TextStyle e TextAlign

/* File: lib/text/questao005.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao005App());

class TextQuestao005App extends StatelessWidget {
  const TextQuestao005App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'Texto estilizado',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
