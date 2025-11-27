// Questão 004 — Estrutura e Layout
// Descrição: Em Row/Column, garantir espaço com SizedBox/Expanded para evitar cortes.

/* File: lib/circle_avatar/questao004.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao004App());

class CircleAvatarQuestao004App extends StatelessWidget {
  const CircleAvatarQuestao004App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Avatar em Row')),
        body: Column(children: [
          // ERRO: sem espaço
          Row(children: [const CircleAvatar(radius: 40), const Text('Nome')]),
          const SizedBox(height: 20),
          // CORREÇÃO
          Row(children: [const CircleAvatar(radius: 24), const SizedBox(width: 12), const Expanded(child: Text('Nome do usuário que pode ser longo'))]),
        ]),
      ),
    );
  }
}
