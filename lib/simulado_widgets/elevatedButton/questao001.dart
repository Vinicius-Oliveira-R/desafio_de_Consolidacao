// Questão 001 — Contexto e Hierarquia
// Descrição: ElevatedButton precisa de um ancestor Material (MaterialApp provides it) para estilos e efeitos visuais.
// Exemplo completo:

/* File: lib/elevated_button/questao001.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao001App());

class ElevatedButtonQuestao001App extends StatelessWidget {
  const ElevatedButtonQuestao001App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ElevatedButton(onPressed: null, child: Text('Desabilitado')),
        ),
      ),
    );
  }
}