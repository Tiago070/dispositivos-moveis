// Bloco G — Classes e objetos

class Produtor {
  final String nome;
  final String cidade;
  final String? telefone;

  Produtor({required this.nome, required this.cidade, this.telefone});

  // G2: construtor nomeado sem telefone
  Produtor.semTelefone({required String nome, required String cidade})
      : this(nome: nome, cidade: cidade, telefone: null);
}

class Talhao {
  final String nome;
  final double area;
  final String cultura;

  static const double alqueireGoiano = 2.42; // G5

  Talhao({required this.nome, required this.area, required this.cultura});

  // G3: campo calculado área em alqueires
  double get areaAlqueires => area / Talhao.alqueireGoiano;

  bool get hasLess20 => area < 20;

  // G4: sobrescreve toString
  @override
  String toString() => 'Talhão $nome: $area ha ($cultura)';
}

void main() {
  print('--- Bloco G ---');
  // G5: acessar constante sem criar objeto
  print('G5: alqueire goiano = ${Talhao.alqueireGoiano} ha');

  // G6: lista de talhões e agregações
  final lista = [
    Talhao(nome: 'T1', area: 12.0, cultura: 'Soja'),
    Talhao(nome: 'T2', area: 45.0, cultura: 'Milho'),
    Talhao(nome: 'T3', area: 80.0, cultura: 'Soja'),
  ];
  final totalArea = lista.map((t) => t.area).fold(0.0, (p, e) => p + e);
  final sojas = lista.where((t) => t.cultura == 'Soja').toList();
  final maior = lista.reduce((a, b) => a.area > b.area ? a : b);
  print('G6: totalArea=$totalArea, sojas=${sojas.length}, maior=${maior.nome}');

  // G7: classes de cultura (abstrata e concretas)
  final culturas = [Milho(cicloDias: 120), SojaC(cicloDias: 110)];
  for (var c in culturas) {
    print('G7: ${c.resumo()}');
  }
}

// G7: classe abstrata e subclasses
abstract class Cultura {
  final String nome;
  final int cicloDias;
  Cultura(this.nome, this.cicloDias);
  String resumo() => '$nome: $cicloDias dias';
}

class Milho extends Cultura {
  Milho({required int cicloDias}) : super('Milho', cicloDias);
}

class SojaC extends Cultura {
  SojaC({required int cicloDias}) : super('Soja', cicloDias);
}
