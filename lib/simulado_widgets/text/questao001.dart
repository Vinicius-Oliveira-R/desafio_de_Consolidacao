
// ## 🧩 Questões

// ### Contexto e Hierarquia  
// O widget `"X"` requer um **contexto ou estrutura pai específica** para funcionar corretamente?  
// **Justifique** sua resposta.  
// Em seguida, escreva um **exemplo funcional** demonstrando a situação (exemplo: dentro ou fora de um `Container` ou `Scaffold`).

import 'package:flutter/material.dart';

void main() => runApp(const TextQuestao001App());

class TextQuestao001App extends StatelessWidget {
  const TextQuestao001App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Texto funcionando sem pai especializado'),
        ),
      ),
    );
  }
}class TextQuestao001 {
  String descricao() => "O widget Text não exige pai específico.";
}

// ### Estado e Utilidade  
// Em que situação o widget `"X"` poderia ser **útil dentro de um `StatefulWidget`**?  
// Quais benefícios ele traria em relação à interação, comportamento dinâmico ou atualização visual?  
// **Implemente um exemplo funcional do que citou.**

// ### Independência e Renderização  
// O widget `"X"` pode **existir isoladamente**, sem depender de outro widget estrutural?  
// Explique **por que sim ou não**, e apresente um exemplo funcional **com e sem contêiner pai**.

// ---

// ### Estrutura e Layout  
// Quando o widget `"X"` é posicionado dentro de widgets como `Column` ou `Row`, quais **cuidados de layout e alinhamento** devem ser observados?  
// Explique e demonstre com código **um cenário de erro e outro corrigido**.

// ---

// ### Estilo e Personalização  
// Como personalizar o widget `"X"` para alterar **aparência, tamanho, cor ou comportamento**?  
// Demonstre por código ao menos **duas propriedades importantes** do widget.

// ---

// ### Interação e Eventos  
// O widget `"X"` pode **disparar eventos** de interação (ex: toque, clique, digitação)?  
// Descreva o comportamento e **demonstre como capturar ou reagir** ao evento.

// ---

// ### Composição  
// É possível **compor o widget `"X"` com outros widgets** para criar algo mais complexo?  
// Dê um exemplo prático de composição, explicando a hierarquia usada.


// ### Performance  
// Em que situações o uso excessivo do widget `"X"` pode **impactar a performance da renderização**?  
// Justifique e demonstre **uma forma otimizada de uso**.



// ### Reutilização  
// Como transformar o widget `"X"` em um **widget personalizado reutilizável**?  
// Crie um **widget próprio** que use `"X"` internamente e explique seus benefícios.