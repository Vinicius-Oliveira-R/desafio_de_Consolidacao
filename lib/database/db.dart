import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


class DB {
DB._privateConstructor();
static final DB instance = DB._privateConstructor();
Database? _db;


Future<Database> get database async {
if (_db != null) return _db!;
await init();
return _db!;
}


Future<void> init() async {
if (_db != null) return;
final documentsDirectory = await getApplicationDocumentsDirectory();
final path = join(documentsDirectory.path, 'dcap.db');
_db = await openDatabase(
path,
version: 1,
onCreate: _onCreate,
);
}


Future<void> _onCreate(Database db, int version) async {
await db.execute('''
CREATE TABLE estado (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nome TEXT NOT NULL,
uf TEXT NOT NULL
);
''');


await db.execute('''
CREATE TABLE cidade (
id INTEGER PRIMARY KEY AUTOINCREMENT,
nome TEXT NOT NULL,
estado_id INTEGER NOT NULL,
ativa INTEGER NOT NULL DEFAULT 1,
FOREIGN KEY (estado_id) REFERENCES estado(id)
);
''');
}


Future<void> close() async {
if (_db != null) {
await _db!.close();
_db = null;
}
}
}