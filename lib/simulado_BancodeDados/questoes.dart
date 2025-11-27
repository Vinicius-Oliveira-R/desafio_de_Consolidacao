## Parte A — Estrutura da Tabela e Modelagem

**1. Por que `ativa` é INTEGER e o que fazer no DTO?**
SQLite não tem tipo booleano nativo; usa INTEGER com 0/1. No DTO você deve mapear entre `int` e `bool` — por exemplo no `fromMap` usar `ativa = map['ativa'] == 1` e no `toMap` usar ` 'ativa': ativa ? 1 : 0`. Isso garante que o app trabalhe com `bool` e o banco armazene `INTEGER`.

**2. Por que `estado_id` deve ser INTEGER e não TEXT?**
Porque é uma chave estrangeira apontando para `estado.id`, que é `INTEGER PRIMARY KEY`. Usar o mesmo tipo (INTEGER) evita conversões, permite índices numéricos eficientes e integridade referencial correta. Se fosse TEXT haveria perda de semântica e indexação.

**3. O `id` precisa ser incluído em `toMap()`?**
Depende do uso: ao inserir (`INSERT`) com `AUTOINCREMENT`, normalmente **não** inclui `id` (o banco gera). Ao atualizar (`UPDATE`) ou ao construir um mapa para envio (por exemplo atualização), **deve** incluir `id`. Conclusão: `toMap()` pode omitir `id` para criação, mas você normalmente fornece outro método `toMapWithId()` ou incluir `id` condicionalmente quando for `!= null`.

**4. O que acontece sem `FOREIGN KEY` e tentar excluir um estado com cidades vinculadas?**
Sem `FOREIGN KEY` o banco não impede a exclusão: você pode apagar o estado e as cidades continuam apontando para um `estado_id` inexistente — cria inconsistência referencial (registros órfãos). Se o app espera a integridade, ele quebrará ao tentar relacionar.

**5. Como garantir exclusão segura sem integridade referencial ativada?**
Implementar lógica de aplicação: ao excluir um estado, primeiro verificar/remo ver ou atualizar as cidades relacionadas (`DELETE FROM cidade WHERE estado_id = ?` ou `UPDATE cidade SET estado_id = NULL WHERE estado_id = ?` se permitir null). Transacionar as operações (`BEGIN TRANSACTION`, `COMMIT`) para atomicidade.

**6. Conversão `1`↔`true` em Flutter — onde aparece?**
Normalmente no construtor `fromMap`/`fromJson` do DTO: `ativa = (map['ativa'] ?? 0) == 1;`. No `toMap()` faz o inverso: `'ativa': ativa ? 1 : 0`. Essa lógica fica no modelo/DTO.

**7. Por que listas são armazenadas como TEXT e como recuperar?**
SQLite não tem tipo array; então serializa-se a lista em texto (JSON) — por exemplo `grade_bikes TEXT` contendo `'[1,2,3]'` ou `'["A","B"]'`. No DTO é necessário desserializar: `List<int>.from(jsonDecode(map['grade_bikes']))` ou `List<String>.from(...)`. Recomenda-se usar JSON para interoperabilidade.

**8. Impacto de `NOT NULL` em todos os campos**
`NOT NULL` obriga que cada coluna receba um valor em `INSERT`. Se o app tentar inserir `NULL` ocorrerá erro `DatabaseException` (constraint failed). `NOT NULL` melhora integridade, mas exige que o app sempre forneça valores padrões ou validação antes do `INSERT`. Em migrações, adicionar `NOT NULL` a colunas existentes requer fornecer valores default.

---

## Parte B — Modelos e Mapeamento

**1. O que muda ao listar `cidade` (tem `estado_id`)?**
No mapeamento, além de `id`, `nome`, você deve extrair `estadoId = maps[i]['estado_id']` e também `ativa = maps[i]['ativa'] == 1`. O construtor da `Cidade` deve aceitar `estadoId` (int) e `ativa` (bool) ou você cria setters adequados.

**2. `id` precisa estar no construtor da `Cidade`?**
Não obrigatoriamente: para criar (`INSERT`) o DTO pode ter `id` nulo; para retornar resultados do DB geralmente o `id` é incluído no DTO. É comum ter `id` opcional (`int? id`) no construtor para permitir criação antes do banco gerar o id.

**3. Por que `List.generate` é usado em vez de `for`?**
`List.generate` cria a lista diretamente em uma expressão funcional e é conciso. Em performance não há diferença significativa; `List.generate` é idiomático para converter `List<Map>` em `List<DTO>`. Um `for` explícito funciona igual.

**4. Como gerar lista de DTOs sem criar manualmente `List<Map>`?**
`db.query` já retorna `List<Map<String, dynamic>>`. Para não manipular a lista manualmente, use: `maps.map((m) => Estado.fromMap(m)).toList();` — isso transforma diretamente em DTOs.

**5. Incluir nome do estado no DTO de Cidade (usando JOIN)**
Modificar a query para `SELECT c.id, c.nome, c.estado_id, c.ativa, e.nome AS estado_nome FROM cidade c JOIN estado e ON c.estado_id = e.id`. No mapeamento use `maps[i]['estado_nome']` e inclua no construtor `Cidade(..., estadoNome: maps[i]['estado_nome'])`.

**6. Exibir apenas cidades ativas**
Adicionar condição `WHERE ativa = 1` na query: `final maps = await db.query('cidade', where: 'ativa = ?', whereArgs: [1]);` ou com rawQuery: `SELECT * FROM cidade WHERE ativa = 1`.

**7. Se `toMap()` esquecer `uf`, o que acontece ao inserir?**
O campo `uf` ficará NULL no mapa enviado. Se `uf` é `NOT NULL`, o `INSERT` falhará com `DatabaseException`. Se `uf` aceitar NULL, será gravado como NULL e dados ficarão incompletos.

**8. Diferença entre `db.query()` e `db.rawQuery()`**
`db.query()` é uma API de alto nível que monta a SQL para você (tabela, columns, where, orderBy) e evita erros de concatenação; `db.rawQuery()` aceita uma string SQL completa, oferecendo flexibilidade (joins complexos, subqueries) mas exige atenção à injeção e interpolação correta.

---

## Parte C — Conexão e Inicialização

**1. Risco de `deleteDatabase(path)` em produção**
Apaga todos os dados do usuário permanentemente — perda de dados. Uso só em desenvolvimento/testes.

**2. Se alterar script SQL e reexecutar sem deletar banco**
`onCreate` não será chamado novamente; banco antigo permanece com esquema antigo. Se quiser aplicar mudanças precisa usar `onUpgrade` (ou deletar o banco para dev).

**3. Por que `onCreate` é chamado só uma vez?**
Porque `onCreate` é executado quando o arquivo do banco **é criado** pela primeira vez. Em execuções subsequentes o banco já existe.

**4. Forma mais simples de adicionar coluna `observacoes TEXT` sem recriar**
Usar `ALTER TABLE estado ADD COLUMN observacoes TEXT;` dentro do `onUpgrade` (quando aumentar `version`) ou executar raw SQL ao detectar versão antiga.

**5. O que é o `path` e onde o banco é armazenado**
`path` é o caminho do arquivo do SQLite no sistema de arquivos do dispositivo (p.ex. `getDatabasesPath()` + `/meuapp.db`). Em Android: `/data/data/<package>/databases/...`; iOS: diretório de documentos do app.

**6. O que ocorre se abrir conexão 3x sem Singleton**
Cria múltiplas instâncias do DB, consumo extra de recursos, possíveis locks/concorrência e comportamento inesperado; operações simultâneas podem conflitar.

**7. O que ajustar para evitar conexões abertas indefinidamente?**
Usar padrão Singleton para a conexão compartilhada; abrir no app start e só fechar no shutdown (ou nunca fechar até app encerrar). Gerenciar timeouts e garantir `close()` em `dispose()` de objetos que abrem conexões temporárias.

**8. Por que centralizar a conexão em uma classe?**
Centraliza configurações, versões, migrações, reaproveita a conexão (evita múltiplas aberturas), facilita testes e manutenção, e reduz risco de deadlocks ou leaks.

---

## Parte D — Operações e Erros Comuns

**1. O que ocorre se omitir `await` antes de `db.insert()`?**
`db.insert()` retorna um `Future`; sem `await` a função `salvarSala` pode continuar e fechar (`db.close()`) antes da conclusão do `insert`, potencialmente cancelando a operação ou provocando erro. Deve `await` a operação para garantir conclusão.

**2. Por que fechar o DB a cada operação prejudica desempenho?**
Open/close são caros; fechar rapidamente impede reaproveitamento da conexão, aumenta latência e pode causar contenção se várias operações são solicitadas em sequência.

**3. Como tratar falhas de inserção?**
Envolver em `try/catch`, capturar `DatabaseException`, exibir/logar erro e informar o usuário. Também usar transações para múltiplas operações.

Exemplo:

```dart
try {
  await db.insert('sala', sala.toMap());
} on DatabaseException catch (e) {
  // tratar duplicidade, constraint, etc.
} catch (e) {
  // fallback
}
```

**4. Forma correta de capturar `DatabaseException`**

```dart
try {
  await db.insert('sala', sala.toMap());
} on DatabaseException catch (e) {
  // e.isUniqueConstraintError? (ver mensagem) — trate conforme necessário
  rethrow; // ou log + mostrar msg ao usuário
}
```

**5. Se conexão for fechada durante outra operação**
A operação em andamento pode lançar erro (ex: "DatabaseException: bad state: Database has already been closed") ou falhar de forma imprevisível. Deve-se coordenar acesso com locks/queue ou manter conexão aberta.

**6. Quando `insert` pode falhar mesmo com dados válidos?**

* Violação de `UNIQUE` ou `NOT NULL` constraints.
* Transação travada por outro processo.
* Falta de espaço em disco.
* Tipo incorreto em coluna com trigger.
* Banco fechado antes do commit.

**7. Diferença entre `db.insert()` e `db.rawInsert()`**
`db.insert()` é uma API segura que monta SQL e trata escaping/whereArgs; `db.rawInsert()` recebe SQL cru e é mais flexível (p.ex. `rawInsert('INSERT INTO t(x) VALUES(?)', [v])`) mas exige maior cuidado para evitar injeção e erros.

**8. Duas boas práticas de tratamento de exceções em SQLite**

* Sempre `try/catch` e capturar `DatabaseException` para interpretar códigos/mensagens (constraints).
* Usar transações (`db.transaction`) para operações múltiplas e `finally` para liberar recursos; logar erros com contexto útil.

---

## Parte E — Integração com a Interface

**1. Em que ponto chamar `setState`?**
Após receber os dados assíncronos e atualizar a lista usada pelo `build`. Ex.: ao finalizar `await carregarCidades(estadoId)`, atualizar a lista `cidades` e então `setState(() { cidades = resultado; selectedCidade = null; });`.

**2. O que acontece se o Dropdown for criado dentro de `StatelessWidget`?**
Não pode manter estado interno (seleção, lista dinâmica). Você teria que elevar o estado para um ancestor `StatefulWidget` ou usar `ValueNotifier`/`Provider`. Em `StatelessWidget` o dropdown pode exibir dados fixos, mas não reagirá a mudanças internas.

**3. Comportamento se estado mudar e dropdown cidade não for limpo**
O dropdown pode mostrar cidades do estado anterior, causando incoerência: seleção inválida (cidade de outro estado). Deve limpar `selectedCidade` e recarregar opções ao mudar o estado.

**4. Comportamento quando lista de estados estiver vazia**
O primeiro dropdown deve mostrar placeholder/desabilitado (`items: []` e `onChanged: null`) ou uma mensagem "Nenhum estado disponível". UI deve prevenir escolha e possibilitar adicionar estado.

**5. Como preencher primeiro Dropdown a partir de `Future<List<Estado>>`**
Exemplo mínimo:

```dart
class _FormState extends State<FormPage> {
  List<Estado> estados = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    carregarEstados();
  }

  Future<void> carregarEstados() async {
    final lista = await daoEstado.buscarTodos(); // Future<List<Estado>>
    setState(() {
      estados = lista;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return CircularProgressIndicator();
    return DropdownButton<Estado>(
      value: selectedEstado,
      items: estados.map((e) => DropdownMenuItem(value: e, child: Text(e.nome))).toList(),
      onChanged: (e) => setState(() { selectedEstado = e; carregarCidades(e!.id); }),
    );
  }
}
```

**6. Por que a função que carrega cidades deve ser `async`?**
Porque a leitura do banco é assíncrona (I/O). `async` permite `await` na consulta e tratamento de erros; sem isso a UI tentaria usar dados antes de estarem prontos.

**7. Como lidar se usuário escolher outro estado rapidamente antes da carga terminar?**
Gerenciar cancelamento/versões: ao iniciar carga, incrementar um token `int loadCounter++`; quando a consulta termina, só aplicar resultado se `token == currentToken`. Alternativamente usar `Future` guardado e `mounted` check, ou cancelar requests com `CancelableOperation`. Exemplo simples:

```dart
int _loadId = 0;
Future<void> carregarCidades(int estadoId) async {
  final id = ++_loadId;
  final res = await daoCidade.buscarPorEstado(estadoId);
  if (id != _loadId) return; // resultado obsoleto
  setState(() => cidades = res);
}
```

**8. Se lista mudar mas `setState` não for chamado, o que ocorre?**
A UI não se atualiza — o novo conteúdo não é exibido. O `build()` não é re-executado, então o Dropdown continuará mostrando dados antigos. É por isso que atualizações de estado devem ocorrer dentro de `setState` ou via gerenciadores de estado reativos.

