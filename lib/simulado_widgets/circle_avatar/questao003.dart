// Questão 003 — Independência e Renderização
// Exemplo: isolado vs dentro de pai

/* File: lib/circle_avatar/questao003.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao003App());

class CircleAvatarQuestao003App extends StatelessWidget {
  const CircleAvatarQuestao003App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('CircleAvatar independencia')),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          // isolado
          const CircleAvatar(radius: 24, backgroundColor: Colors.green),
          const SizedBox(height: 16),
          // com pai (Center)
          Center(child: CircleAvatar(radius: 24, backgroundColor: Colors.orange)),
        ]),
      ),
    );
  }
}
