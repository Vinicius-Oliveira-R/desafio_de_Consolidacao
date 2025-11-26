// Estilo e Personalização
// Como personalizar o widget "X" para alterar aparência, tamanho, cor ou comportamento?
// Demonstre por código ao menos duas propriedades importantes do widget.
//Podemos personalizar um widget como container utilizando width e height para definirmos um tamanho, e podemos utilizar color para definirmos uma cor de fundo que vai representar o nosso quadrado, assim como podemos incluir textos e personaliza-lo da cor que for mais conveniente

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Exemplo de personalização",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
