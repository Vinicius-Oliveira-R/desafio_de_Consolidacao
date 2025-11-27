// Questão 002 — Estado e Utilidade
// Exemplo: botão que altera estado

/* File: lib/elevated_button/questao002.dart */
import 'package:flutter/material.dart';

void main() => runApp(const ElevatedButtonQuestao002App());

class ElevatedButtonQuestao002App extends StatelessWidget {
  const ElevatedButtonQuestao002App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: BotaoEstadoPage());
  }
}

class BotaoEstadoPage extends StatefulWidget {
  const BotaoEstadoPage({super.key});
  @override
  State<BotaoEstadoPage> createState() => _BotaoEstadoPageState();
}

class _BotaoEstadoPageState extends State<BotaoEstadoPage> {
  String mensagem = 'Nada ainda';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ElevatedButton com Estado')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(mensagem),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () => setState(() => mensagem = 'Botão pressionado'),
            child: const Text('Pressione'),
          ),
        ]),
      ),
    );
  }
}
