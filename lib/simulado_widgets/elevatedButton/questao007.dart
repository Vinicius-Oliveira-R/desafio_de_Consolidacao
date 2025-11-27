// Questão 007 — Composição
// Exemplo: botão com ícone e texto (Row dentro do child)

/* File: lib/elevated_button/questao007.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao007App());

class ElevatedButtonQuestao007App extends StatelessWidget {
  const ElevatedButtonQuestao007App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: ComposedButton())));
  }
}

class ComposedButton extends StatelessWidget {
  const ComposedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Row(mainAxisSize: MainAxisSize.min, children: const [Icon(Icons.send), SizedBox(width: 8), Text('Enviar')]),
    );
  }
}