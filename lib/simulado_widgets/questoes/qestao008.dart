// Performance
// Em que situações o uso excessivo do widget "X" pode impactar a performance da renderização?
// Justifique e demonstre uma forma otimizada de uso.
// O widget mais utilizado é Conatiner e também o mais pesado pois dentro dele temos que definir todo o escopo da nossa tela isto é, temos que definirmos paddin, alignment, color, margin e dentre outros. Este comportamento faz como que o processador calcular tudo oque definimos. outro exemplo també é a utilização de Row e Column execivamente, pois se é utilizado com muita frequencia o flutter tem que calcular vários passos até renderizar o layout
// Para servir de exemplo vou refatorar o código utilizado na questão 007

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
    );
  }
}
