// Questão 008 — Performance
// Descrição: Avatar com NetworkImage em ListView pode impactar se não houver cache; usar CachedNetworkImage (package) ou placeholder.

/* File: lib/circle_avatar/questao008.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao008App());

class CircleAvatarQuestao008App extends StatelessWidget {
  const CircleAvatarQuestao008App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context, index) => ListTile(leading: const CircleAvatar(radius: 20), title: Text('User \$index')),
        ),
      ),
    );
  }
}
