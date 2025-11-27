// Questão 005 — Estilo e Personalização
// Exemplo: backgroundImage e child icon

/* File: lib/circle_avatar/questao005.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao005App());

class CircleAvatarQuestao005App extends StatelessWidget {
  const CircleAvatarQuestao005App({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white, size: 40),
          ),
        ),
      ),
    );
  }
}

