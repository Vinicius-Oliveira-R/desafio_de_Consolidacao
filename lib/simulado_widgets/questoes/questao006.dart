// Interação e Eventos
// O widget "X" pode disparar eventos de interação (ex: toque, clique, digitação)?
// Descreva o comportamento e dem onstre como capturar ou reagir ao evento.
// Sim, o widget pode disparar eventos como ao pressionar botão ele pode emitir uma mensagem de "Voce precionou um botão" ou ao digitar um text podemos disparar uma mensagem de "Você preencheu este campo"

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String mensagem = "";
  String digite = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    mensagem = "Apertou o botão!";
                  });
                },
                child: const Text("Aperte"),
              ),
              const SizedBox(height: 20),

              SizedBox(
                width: 250,
                child: TextField(
                  onChanged: (valor) {
                    setState(() {
                      digite = valor;
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: "Digite algo",

                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Mensagem: $mensagem",
                style: const TextStyle(
                  fontSize: 20, 
                  color: Colors.green,  
                ),
              ),
              const SizedBox(height: 20),
              Text(
                  "Voce digitou: $digite",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.grey,
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
