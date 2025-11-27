// Questão 001 — Contexto e Hierarquia
// Descrição: CircleAvatar pode ser usado em qualquer lugar; não requer Material especificamente.

/* File: lib/circle_avatar/questao001.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao001App());

class CircleAvatarQuestao001App extends StatelessWidget {
  const CircleAvatarQuestao001App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: Scaffold(body: Center(child: CircleAvatar(radius: 30, backgroundColor: Colors.blue))));
  }
}