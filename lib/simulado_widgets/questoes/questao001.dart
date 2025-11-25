// O widget "X" requer um contexto ou estrutura pai específica para funcionar corretamente?
// Justifique sua resposta.

// Sim, um widget nescessita de uma estrutura pai para ser construido, pois, a composição de sua hierarquia 
// se constroi dentro do Context do widget 


// Em seguida, escreva um exemplo funcional demonstrando a situação (exemplo: dentro ou fora de um Container ou Scaffold).


import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text("demonstração de estrutura Pai dentro de um Scaffold")
          ),
        ),
        //title: const Text("deonstração de estrutura Pai fora do Scaffold"),
    );
  }

}
