// Bloco E — Coleções

void main() {
  print('--- Bloco E ---');
  e1_listasBasicas();
  e2_listaParaConjunto();
  e3_mapaCotacao();
  e4_imprimirMapa();
  e5_areasWhereMapFold();
  e6_anyEveryFirstWhere();
  e7_ordenarAreas();
}

// E1: criar lista de culturas, acrescentar, remover e imprimir info
void e1_listasBasicas() {
  final culturas = ['Soja', 'Milho', 'Algodão'];
  culturas.add('Feijão');
  culturas.remove('Algodão');
  print('E1: tamanho=${culturas.length}, primeiro=${culturas.first}, último=${culturas.last}');
}

// E2: converter lista com repetição para conjunto
void e2_listaParaConjunto() {
  final repetidas = ['Soja', 'Milho', 'Soja', 'Feijão', 'Milho'];
  final conjunto = repetidas.toSet();
  print('E2: lista=$repetidas');
  print('E2: conjunto=$conjunto');
}

// E3: mapa de cultura -> preço da saca
void e3_mapaCotacao() {
  final mapa = <String, double>{'Soja': 128.4, 'Milho': 75.0};
  mapa['Feijão'] = 210.5; // acrescenta
  print('E3: consulta existente Soja=${mapa['Soja']}');
  print('E3: consulta inexistente Trigo=${mapa['Trigo']}'); // devolve null
}

// E4: percorrer mapa com entries e imprimir formatado
void e4_imprimirMapa() {
  final mapa = <String, double>{'Soja': 128.4, 'Milho': 75.0, 'Feijão': 210.5};
  for (final e in mapa.entries) {
    final preco = e.value.toStringAsFixed(2).replaceAll('.', ',');
    print('${e.key}: R\$ $preco');
  }
}

// E5: where (>30), map (ha->alqueires), fold (somar) em expressão encadeada
void e5_areasWhereMapFold() {
  final areas = [12.0, 45.0, 60.0, 28.0, 35.0];
  final totalAlqueires = areas.where((a) => a > 30).map((a) => a / 2.42).fold(0.0, (p, e) => p + e);
  print('E5: total alqueires (áreas>30) = ${totalAlqueires.toStringAsFixed(2)}');
}

// E6: any, every, firstWhere
void e6_anyEveryFirstWhere() {
  final areas = [12.0, 45.0, 60.0, 28.0, 35.0];
  print('E6: existe >40? ${areas.any((a) => a > 40)}');
  print('E6: todos >10? ${areas.every((a) => a > 10)}');
  final primeiroAbaixo20 = areas.firstWhere((a) => a < 20, orElse: () => -1);
  print('E6: primeiro abaixo de 20 = $primeiroAbaixo20');
}

// E7: ordenar lista do maior para o menor com sort e compareTo; depois inverter operandos
void e7_ordenarAreas() {
  final areas = [12.0, 45.0, 60.0, 28.0, 35.0];
  areas.sort((a, b) => b.compareTo(a)); // maior -> menor
  print('E7: ordenado desc = $areas');
  areas.sort((a, b) => a.compareTo(b)); // menor -> maior
  print('E7: invertendo operandos = $areas');
}
