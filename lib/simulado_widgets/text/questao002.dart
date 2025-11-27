//Questão 002 — Estado e Utilidade
// Descrição: Text é útil em StatefulWidget para exibir dados mutáveis (contador, resposta de API, input do usuário).
// Exemplo funcional completo:

/* File: lib/text/questao002.dart */
import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao002App());

class TextQuestao002App extends StatelessWidget {
  const TextQuestao002App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: TextoDinamicoPage());
  }
}

class TextoDinamicoPage extends StatefulWidget {
  const TextoDinamicoPage({super.key});

  @override
  State<TextoDinamicoPage> createState() => _TextoDinamicoPageState();
}

class _TextoDinamicoPageState extends State<TextoDinamicoPage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Text em StatefulWidget')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Contador: $contador'),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => setState(() => contador++),
              child: const Text('Incrementar'),
            ),
          ],
        ),
      ),
    );
  }
}
