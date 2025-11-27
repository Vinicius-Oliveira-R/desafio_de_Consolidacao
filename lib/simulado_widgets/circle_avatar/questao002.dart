// Questão 002 — Estado e Utilidade
// Exemplo: avatar que muda de tamanho com setState

/* File: lib/circle_avatar/questao002.dart */
import 'package:flutter/material.dart';

void main() => runApp(const CircleAvatarQuestao002App());

class CircleAvatarQuestao002App extends StatelessWidget {
  const CircleAvatarQuestao002App({super.key});
  @override
  Widget build(BuildContext context) => const MaterialApp(home: AvatarEstadoPage());
}

class AvatarEstadoPage extends StatefulWidget {
  const AvatarEstadoPage({super.key});
  @override
  State<AvatarEstadoPage> createState() => _AvatarEstadoPageState();
}

class _AvatarEstadoPageState extends State<AvatarEstadoPage> {
  double tamanho = 30;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Avatar Dinâmico')),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          CircleAvatar(radius: tamanho, backgroundColor: Colors.black, child: const Icon(Icons.person, color: Colors.white)),
          const SizedBox(height: 12),
          ElevatedButton(onPressed: () => setState(() => tamanho = tamanho == 30 ? 50 : 30), child: const Text('Toggle Tamanho')),
        ]),
      ),
    );
  }
}

// Exemplo de formulário com validação (StatefulWidget obrigatório para controllers)
class ExemploForm extends StatefulWidget {
@override
State<ExemploForm> createState() => _ExemploFormState();
}
class _ExemploFormState extends State<ExemploForm> {
final _formKey = GlobalKey<FormState>();
final _nomeCtrl = TextEditingController();
@override void dispose() { _nomeCtrl.dispose(); super.dispose(); }
@override
Widget build(BuildContext context) {
return Form(
key: _formKey,
child: Column(children: [
TextFormField(controller: _nomeCtrl, validator: (v) => v==null||v.isEmpty? 'Obrigatório': null),
ElevatedButton(onPressed: (){
if(_formKey.currentState!.validate()){
// salvar
}
}, child: Text('Salvar'))
]),
);
}
}