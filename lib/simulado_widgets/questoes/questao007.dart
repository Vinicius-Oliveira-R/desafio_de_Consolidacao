// Composição
// É possível compor o widget "X" com outros widgets para criar algo mais complexo?
// Dê um exemplo prático de composição, explicando a hierarquia usada.
// sim, é possivel compor um widget X com outro widget para criar algo mais complexo, por exemplo utilizar Row dentro de container

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Center(child: PerfilCard())),
    );
  }
}

class PerfilCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.red,width: 2),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
              CircleAvatar(
              radius: 30,
              backgroundColor: Colors.black,
              child: Icon(Icons.person, color: Colors.white,)
            ),
          const SizedBox(width: 16),
          Expanded(
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const[
                Text('OI, este é um exemplo de utilização de widgets que se complementao para criar algo mais complexo',
                style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
