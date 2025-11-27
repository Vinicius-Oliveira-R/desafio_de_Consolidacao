// Questão 003 — Independência e Renderização
// Descrição: ElevatedButton sem Material ancestor perde visual; demonstramos com e sem Material.

/* File: lib/elevated_button/questao003.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao003App());

class ElevatedButtonQuestao003App extends StatelessWidget {
  const ElevatedButtonQuestao003App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Independência do ElevatedButton')),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CORRETO: dentro de MaterialApp/Scaffold
            Center(child: ElevatedButton(onPressed: () {}, child: const Text('Com Material'))),

            const SizedBox(height: 20),

            // INCORRETO: isolado em um widget sem Material (ainda aparece em muitos casos, mas perde efeitos Materal)
            Center(child: Builder(builder: (c) => ElevatedButton(onPressed: () {}, child: const Text('Ainda funciona aqui')))),
          ],
        ),
      ),
    );
  }
}
