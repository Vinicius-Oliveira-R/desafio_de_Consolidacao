// Questão 009 — Reutilização
// Exemplo: widget AvatarUsuario reutilizável

/* File: lib/circle_avatar/questao009.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao009App());

class CircleAvatarQuestao009App extends StatelessWidget {
  const CircleAvatarQuestao009App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: AvatarUsuario(initials: 'AB'))));
  }
}

class AvatarUsuario extends StatelessWidget {
  final String? imageUrl;
  final String initials;
  final double size;
  const AvatarUsuario({this.imageUrl, required this.initials, this.size = 32, super.key});

  @override
  Widget build(BuildContext context) {
    if (imageUrl != null) {
      return CircleAvatar(radius: size, backgroundImage: NetworkImage(imageUrl!));
    }
    return CircleAvatar(radius: size, child: Text(initials));
  }
}
