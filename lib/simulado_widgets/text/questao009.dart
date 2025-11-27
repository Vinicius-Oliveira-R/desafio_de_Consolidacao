// Questão 009 — Reutilização
// Descrição: Criar widget reutilizável que encapsula Text com estilo padrão.

/* File: lib/text/questao009.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao009App());

class TextQuestao009App extends StatelessWidget {
  const TextQuestao009App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: const Center(child: Titulo('Texto reutilizável')),
      ),
    );
  }
}

class Titulo extends StatelessWidget {
  final String texto;
  const Titulo(this.texto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(texto, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold));
  }
}

