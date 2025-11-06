// Independência e Renderização
// O widget "X" pode existir isoladamente, sem depender de outro widget estrutural?
// Explique por que sim ou não, e apresente um exemplo funcional com e sem contêiner pai.

// um widget como text pode existir sem estrutura PAI, já um widget como AppBar nescessita da estrutura para funcionar


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/simulado_widgets/questoes/quetao002.dart';

// void main(){
//   runApp(const Center(
//     child: Text(
//       "teste sem estrutura PAI"
//     ),
//   ));
// }

void main(){
  runApp(const MyApp());


}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return  MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: const Text('Exemplo com estrutura Pai')),
          body:  Center(child: Text("depende do Scaffold"),)
        ),
    );
  }
}