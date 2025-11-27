// Questão 006 — Interação e Eventos
// Exemplo: onPressed e onLongPress

/* File: lib/elevated_button/questao006.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao006App());

class ElevatedButtonQuestao006App extends StatelessWidget {
  const ElevatedButtonQuestao006App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Clicado'))),
            onLongPress: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Long Press'))),
            child: const Text('Interaja'),
          ),
        ),
      ),
    );
  }
}
