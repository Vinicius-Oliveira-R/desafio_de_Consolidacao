// Questão 007 — Composição
// Descrição: Text é usado em quase todas composições, como listas, cards e linhas com ícones.

/* File: lib/text/questao007.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao007App());

class TextQuestao007App extends StatelessWidget {
  const TextQuestao007App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: const [
                  Icon(Icons.info),
                  SizedBox(width: 8),
                  Expanded(child: Text('Composição: ícone + texto dentro de um Card')),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}