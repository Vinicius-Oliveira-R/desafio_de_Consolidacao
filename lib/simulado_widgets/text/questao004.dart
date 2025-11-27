// Questão 004 — Estrutura e Layout
// Descrição: Em Row/Column, Text pode exceder espaço; usar Expanded/Flexible para evitar overflow.
// Demonstração: exemplo com erro (overflow) e corrigido.

/* File: lib/text/questao004.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao004App());

class TextQuestao004App extends StatelessWidget {
  const TextQuestao004App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Text em Row — erro vs correção')),
        body: Column(
          children: [
            // ERRO: Text longo sem limites dentro de Row
            Container(
              color: Colors.red.shade50,
              child: Row(
                children: const [
                  Text('Este é um texto extremamente longo que provavelmente causará overflow se não for limitado.'),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // CORREÇÃO: usar Expanded
            Container(
              color: Colors.green.shade50,
              child: Row(
                children: const [
                  Expanded(child: Text('Texto longo agora contido pelo Expanded, sem overflow e com wrap adequado.')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}