// Questão 008 — Performance
// Descrição: Muitos Texts com estilos dinâmicos podem afetar layout; prefira const quando possível.

/* File: lib/text/questao008.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao008App());

class TextQuestao008App extends StatelessWidget {
  const TextQuestao008App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemCount: 1000,
          itemBuilder: (context, index) {
            // Otimização: usar Text simples e const quando possível
            return ListTile(title: Text('Item \$index'));
          },
        ),
      ),
    );
  }
}
