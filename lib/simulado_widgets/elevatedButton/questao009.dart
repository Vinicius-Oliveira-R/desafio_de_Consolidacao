// Questão 009 — Reutilização
// Exemplo: widget de botão padronizado

/* File: lib/elevated_button/questao009.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao009App());

class ElevatedButtonQuestao009App extends StatelessWidget {
  const ElevatedButtonQuestao009App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: BotaoPadrao(texto: 'Salvar', onPress: () => print('Salvar')))));
  }
}

class BotaoPadrao extends StatelessWidget {
  final String texto;
  final VoidCallback onPress;
  const BotaoPadrao({required this.texto, required this.onPress, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPress, child: Text(texto));
  }
}
