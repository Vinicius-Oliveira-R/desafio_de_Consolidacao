import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exemplo Completo Flutter",
      home: const TelaCompleta(),
    );
  }
}

class TelaCompleta extends StatefulWidget {
  const TelaCompleta({super.key});

  @override
  State<TelaCompleta> createState() => _TelaCompletaState();
}

class _TelaCompletaState extends State<TelaCompleta> {
  String textoDigitado = "";

  int indiceMenu = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      // -----------------------------
      // APPBAR
      // -----------------------------
      appBar: AppBar(
        title: const Text("Minha Tela Completa"),
        backgroundColor: Colors.blue,
      ),

      // -----------------------------
      // MENU LATERAL (DRAWER)
      // -----------------------------
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text("Menu Lateral", style: TextStyle(color: Colors.white)),
            ),
            ListTile(title: Text("Item 1")),
            ListTile(title: Text("Item 2")),
          ],
        ),
      ),

      // -----------------------------
      // BODY
      // -----------------------------
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TEXTO
            const Text(
              "Bem-vindo ao Flutter!",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 20),

            // CONTAINER DECORADO
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(50),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.blue, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text("Este é um Container com borda"),
            ),

            const SizedBox(height: 20),

            // ROW
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Exemplo de Row:"),
                Icon(Icons.star, color: Colors.amber.shade700),
              ],
            ),

            const SizedBox(height: 20),

            // TEXTFIELD
            TextField(
              onChanged: (valor) {
                setState(() {
                  textoDigitado = valor;
                });
              },
              decoration: const InputDecoration(
                labelText: "Digite algo",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 10),

            Text("Você digitou: $textoDigitado"),

            const Spacer(),

            // BOTÃO
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar( 
                  const SnackBar(content: Text("Botão clicado!")),
                );
              },
              child: const Text("Clique Aqui"),
            ),
          ],
        ),
      ),

      // -----------------------------
      // FLOATING ACTION BUTTON
      // -----------------------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            textoDigitado = "FAB pressionado";
          });
        },
        child: const Icon(Icons.add),
      ),

      // -----------------------------
      // BOTTOM NAVIGATION BAR
      // -----------------------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indiceMenu,
        onTap: (index) {
          setState(() {
            indiceMenu = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil",
          ),
        ],
      ),
    );
  }
}
