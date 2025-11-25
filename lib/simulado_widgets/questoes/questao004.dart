// //Estrutura e Layout
// //Quando o widget "X" é posicionado dentro de widgets como Column ou Row, quais cuidados de layout e alinhamento devem ser observados?
// //Explique e demonstre com código um cenário de erro e outro corrigido.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp( // Root widget
  //     home: Scaffold(
  //       appBar: AppBar(
  //         title: const Text('My Home Page'),
  //       ),
  //       body: Center(
  //         child: Builder(
  //           builder: (context) {
  //             return Column(
  //               children: [
  //                 const Text('Hello, World!'),
  //                 const SizedBox(height: 50),
  //                 ElevatedButton(
  //                   onPressed: () {
  //                     print('Click!');
  //                   },
  //                   child: const Text('A button'),
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: const Text('ola'),
    );
  }
} 
