// //Estrutura e Layout
// //Quando o widget "X" é posicionado dentro de widgets como Column ou Row, quais cuidados de layout e alinhamento devem ser observados?
// //Explique e demonstre com código um cenário de erro e outro corrigido.
// Os cuidados que devemos ter com o posicionamento de Column e Row dentro de widgets, é sua expansão infinita, se nós não definirmos um limite utilizando EXPANDED alguns widgets como ListView atribuem um tamanha infinito

// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBaar(title: cont Text("maneira errada")),
//         body: Column(
//           children:[
//               ListView(
//                 children: const[
//                   ListTitle(title: Text("Lista 1")),
//                   ListTitle(title: Text("Lista 2")),
//                   ListTitle(title: Text("Lista 3")),
//                   ListTitle(title: Text("Lista 4")),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Maneira correta de impor limites de espaço ")),
          body:Row( 
            children: [ 
              Column(
                  children: [
                    Expanded(
                      child: ListView(
                        children: 
                          const[
                            ListTile(title: Text("item 1")),
                            ListTile(title: Text("item 2")),
                          ],
                      ),
                    ),
                  ],
                ),
              ],
          ),
        ),
    );
  }
}
