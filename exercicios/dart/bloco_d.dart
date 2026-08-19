// Bloco D — Decisão e repetição
// Cada exercício está num função própria, identificada pelo comentário

void main() {
  print('--- Bloco D ---');
  d1_classificarProdutividade(45);
  print('D2: ' + d2_classificarSwitch(65));
  d3_tabelaHectaresParaAlqueires();
  d4_simularColheita();
  d5_imprimirMesesSafra();
  d6_somarAreasComContinueBreak();
}

// D1: Classifique uma produtividade em três faixas usando if/else.
void d1_classificarProdutividade(num prod) {
  if (prod < 50) {
    print('D1: abaixo de 50 sc/ha');
  } else if (prod <= 70) {
    print('D1: entre 50 e 70 sc/ha');
  } else {
    print('D1: acima de 70 sc/ha');
  }
}

// D2: Refaça usando switch como expressão.
String d2_classificarSwitch(num prod) {
  return switch (prod) {
    var p when p < 50 => 'abaixo de 50 sc/ha',
    var p when p <= 70 => 'entre 50 e 70 sc/ha',
    _ => 'acima de 70 sc/ha'
  };
}

// Conversão: 1 alqueire goiano ~= 2.42 hectares
const double _alqueireGoiano = 2.42;

// D3: Imprima tabela de conversão hectares -> alqueires de 10 em 10 até 100
void d3_tabelaHectaresParaAlqueires() {
  print('D3: Hectares -> Alqueires (10 em 10)');
  for (var h = 10; h <= 100; h += 10) {
    final a = h / _alqueireGoiano;
    print('$h ha = ${a.toStringAsFixed(2)} alq');
  }
}

// D4: Simule a colheita com while
void d4_simularColheita() {
  int estoque = 5000;
  const retirada = 350;
  int dias = 0;
  while (estoque > 0) {
    estoque -= retirada;
    dias++;
  }
  print('D4: levaram $dias dias até o estoque acabar');
}

// D5: Percorra lista de meses da safra com for-in e imprima numerado
void d5_imprimirMesesSafra() {
  final meses = ['Outubro', 'Novembro', 'Dezembro', 'Janeiro', 'Fevereiro'];
  int i = 1;
  for (var m in meses) {
    print('D5: $i. $m');
    i++;
  }
}

// D6: Percorra lista de áreas, some apenas >0 usando continue e interrompa com break se passar 200
void d6_somarAreasComContinueBreak() {
  final areas = [12.5, -3.0, 50.0, 0.0, 80.0, 70.0];
  double soma = 0.0;
  for (var a in areas) {
    if (a <= 0) continue;
    soma += a;
    if (soma > 200) {
      print('D6: soma ultrapassou 200 ha, interrompendo');
      break;
    }
  }
  print('D6: soma final = ${soma.toStringAsFixed(2)} ha');
}
