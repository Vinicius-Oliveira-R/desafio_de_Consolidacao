import 'package:flutter/material.dart';
import '../dao/estado_dao.dart';
import '../models/estado.dart';
import 'estado_form.dart';


class EstadoListPage extends StatefulWidget {
const EstadoListPage({super.key});
@override
State<EstadoListPage> createState() => _EstadoListPageState();
}


class _EstadoListPageState extends State<EstadoListPage> {
final EstadoDao _dao = EstadoDao();
List<Estado> _estados = [];


@override
void initState() {
super.initState();
_load();
}


Future<void> _load()