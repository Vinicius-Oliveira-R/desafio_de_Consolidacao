class Cidade {
int? id;
String nome;
int estadoId;
bool ativa;
Cidade({this.id, required this.nome, required this.estadoId, this.ativa = true});


factory Cidade.fromMap(Map<String, dynamic> m) => Cidade(
id: m['id'] as int?,
nome: m['nome'] as String,
estadoId: m['estado_id'] as int,
ativa: (m['ativa'] as int) == 1,
);


Map<String, dynamic> toMap() => {
if (id != null) 'id': id,
'nome': nome,
'estado_id': estadoId,
'ativa': ativa ? 1 : 0,
};
}