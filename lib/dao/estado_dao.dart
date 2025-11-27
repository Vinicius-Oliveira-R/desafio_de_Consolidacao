import 'package:sqflite/sqflite.dart';
import '../database/db.dart';
import '../models/estado.dart';


class EstadoDao {
Future<int> insert(Estado e) async {
final db = await DB.instance.database;
return await db.insert('estado', e.toMap());
}


Future<int> update(Estado e) async {
final db = await DB.instance.database;
return await db.update('estado', e.toMap(), where: 'id = ?', whereArgs: [e.id]);
}


Future<int> delete(int id) async {
final db = await DB.instance.database;
return await db.delete('estado', where: 'id = ?', whereArgs: [id]);
}


Future<List<Estado>> findAll() async {
final db = await DB.instance.database;
final maps = await db.query('estado', orderBy: 'nome');
return maps.map((m) => Estado.fromMap(m)).toList();
}
}