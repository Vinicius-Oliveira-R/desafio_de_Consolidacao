class Estado {
int? id;
String nome;
String uf;
Estado({this.id, required this.nome, required this.uf});


factory Estado.fromMap(Map<String, dynamic> m) => Estado(
id: m['id'] as int?,
nome: m['nome'] as String,
uf: m['uf'] as String,
);


Map<String, dynamic> toMap() => {
if (id != null) 'id': id,
'nome': nome,
'uf': uf,
};
}