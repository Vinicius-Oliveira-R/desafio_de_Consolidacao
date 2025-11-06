// Estado e Utilidade
// Em que situação o widget "X" poderia ser útil dentro de um StatefulWidget?
// Quais benefícios ele traria em relação à interação, comportamento dinâmico ou atualização visual?
// Implemente um exemplo funcional do que citou.



import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ContadorPage(),
    );
  }
}

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Somando mais 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valor atual: $contador',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  contador++;
                });
              },
              child: const Text('Somar +1'),
            ),
          ],
        ),
      ),
    );
  }
}
