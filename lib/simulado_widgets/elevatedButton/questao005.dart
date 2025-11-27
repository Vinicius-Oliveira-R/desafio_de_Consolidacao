// Questão 005 — Estilo e Personalização
// Exemplo: alterar cor e padding

/* File: lib/elevated_button/questao005.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao005App());

class ElevatedButtonQuestao005App extends StatelessWidget {
  const ElevatedButtonQuestao005App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red, padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
            onPressed: null,
            child: Text('Estilizado'),
          ),
        ),
      ),
    );
  }
}