import 'package:sqflite/sqflite.dart';
import '../database/db.dart';
import '../models/cidade.dart';


class CidadeDao {
Future<int> insert(Cidade c) async {
final db = await DB.instance.database;
return await db.insert('cidade', c.toMap());
}


Future<int> update(Cidade c) async {
final db = await DB.instance.database;
return await db.update('cidade', c.toMap(), where: 'id = ?', whereArgs: [c.id]);
}


Future<int> delete(int id) async {
final db = await DB.instance.database;
return await db.delete('cidade', where: 'id = ?', whereArgs: [id]);
}


Future<List<Cidade>> findAll() async {
final db = await DB.instance.database;
final maps = await db.query('cidade', orderBy: 'nome');
return maps.map((m) => Cidade.fromMap(m)).toList();
}


Future<List<Cidade>> findByEstado(int estadoId) async {
final db = await DB.instance.database;
final maps = await db.query('cidade', where: 'estado_id = ?', whereArgs: [estadoId], orderBy: 'nome');
return maps.map((m) => Cidade.fromMap(m)).toList();
}


Future<List<Cidade>> findActiveByEstado(int estadoId) async {
final db = await DB.instance.database;
final maps = await db.query('cidade', where: 'estado_id = ? AND ativa = 1', whereArgs: [estadoId], orderBy: 'nome');
return maps.map((m) => Cidade.fromMap(m)).toList();
}
}