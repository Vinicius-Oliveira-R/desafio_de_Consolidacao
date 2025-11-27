import 'package:flutter/material.dart';
import 'pages/estado_list.dart';
import 'database/db.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await DB.instance.init();
runApp(const MyApp());
}


class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'CRUD Cidade-Estado',
theme: ThemeData(primarySwatch: Colors.blue),
home: const EstadoListPage(),
);
}
}