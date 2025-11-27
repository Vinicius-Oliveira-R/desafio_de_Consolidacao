// Questão 003 — Independência e Renderização
// Descrição: Text pode existir isoladamente, mas precisa de Directionality (geralmente provido por MaterialApp).
// Exemplo com e sem pai:

/* File: lib/text/questao003.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao003App());

class TextQuestao003App extends StatelessWidget {
  const TextQuestao003App({super.key});

  @override
  Widget build(BuildContext context) {
    // Sem MaterialApp o Text pode falhar por falta de Directionality
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Independência do Text')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(child: Text('Texto com pai Center')),
          ],
        ),
      ),
    );
  }
}