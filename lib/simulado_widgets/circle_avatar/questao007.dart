// Questão 007 — Composição
// Exemplo: avatar + coluna de textos

/* File: lib/circle_avatar/questao007.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao007App());

class CircleAvatarQuestao007App extends StatelessWidget {
  const CircleAvatarQuestao007App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(child: PerfilSimples()),
      ),
    );
  }
}

class PerfilSimples extends StatelessWidget {
  const PerfilSimples({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8), boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
      child: Row(children: const [CircleAvatar(radius: 30), SizedBox(width: 12), Expanded(child: Text('Nome do usuário Função', style: TextStyle(fontSize: 16)))]),
    );
  }
}
