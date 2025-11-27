// Questão 004 — Estrutura e Layout
// Descrição: Em Row/Column, controlar largura com Expanded/Flexible para evitar overflow.

/* File: lib/elevated_button/questao004.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao004App());

class ElevatedButtonQuestao004App extends StatelessWidget {
  const ElevatedButtonQuestao004App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Botão em Row')),
        body: Column(children: [
          // ERRO: botão grande sem limites
          Row(children: [ElevatedButton(onPressed: () {}, child: const Text('Texto muito largo sem limite'))]),
          const SizedBox(height: 20),
          // CORREÇÃO
          Row(children: [Expanded(child: ElevatedButton(onPressed: () {}, child: const Text('Botão ajustado com Expanded')))]),
        ]),
      ),
    );
  }
}