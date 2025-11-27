// Questão 006 — Interação e Eventos
// Exemplo: GestureDetector ao redor do avatar

/* File: lib/circle_avatar/questao006.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao006App());

class CircleAvatarQuestao006App extends StatelessWidget {
  const CircleAvatarQuestao006App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Avatar tocado'))),
            child: const CircleAvatar(radius: 30, backgroundColor: Colors.blue, child: Icon(Icons.person, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
