// Bloco J — Integradores
import 'dart:math';

class Registro {
  final String talhao;
  final String atividade;
  final DateTime data;
  final String? observacao;

  Registro({required this.talhao, required this.atividade, required this.data, this.observacao}) {
    if (data.isAfter(DateTime.now())) throw ArgumentError('Data não pode ser futura');
  }
}

Future<double> consultaCotacaoSimulada(String cultura) async {
  // simula demora e possível falha
  await Future.delayed(Duration(milliseconds: 300 + Random().nextInt(400)));
  if (Random().nextDouble() < 0.15) throw Exception('Falha na consulta');
  // valores de exemplo
  return switch (cultura) {
    'Soja' => 128.4,
    'Milho' => 75.0,
    _ => 100.0
  };
}

double receitaBrutaTalhao(double area, double produtividade, double precoSaca) => area * produtividade * precoSaca;

void main() async {
  print('--- Bloco J ---');
  final talhoes = [
    {'nome': 'T1', 'area': 12.0, 'cultura': 'Soja'},
    {'nome': 'T2', 'area': 45.0, 'cultura': 'Milho'},
    {'nome': 'T3', 'area': 80.0, 'cultura': 'Soja'},
  ];

  // J1: relatório da propriedade
  final total = talhoes.map((t) => t['area'] as double).fold(0.0, (p, e) => p + e);
  final porCultura = <String, double>{};
  for (var t in talhoes) {
    final c = t['cultura'] as String;
    porCultura[c] = (porCultura[c] ?? 0) + (t['area'] as double);
  }
  print('J1: área total = ${total.toStringAsFixed(2).replaceAll('.', ',')} ha');
  porCultura.forEach((c, a) {
    final pct = (a / total) * 100;
    print('J1: $c: ${a.toStringAsFixed(2).replaceAll('.', ',')} ha (${pct.toStringAsFixed(1).replaceAll('.', ',')}%)');
  });
  final maior = talhoes.reduce((a, b) => (a['area'] as double) > (b['area'] as double) ? a : b);
  print('J1: maior talhão = ${maior['nome']} com ${(maior['area'] as double).toStringAsFixed(2)} ha');

  // J2: registro de atividades
  final registros = <Registro>[];
  try {
    registros.add(Registro(talhao: 'T1', atividade: 'Plantio', data: DateTime(2023, 10, 10)));
    registros.add(Registro(talhao: 'T2', atividade: 'Colheita', data: DateTime(2025, 12, 1)));
  } catch (e) {
    print('Erro ao criar registro: $e');
  }
  final porTalhao = <String, List<Registro>>{};
  for (var r in registros) {
    porTalhao.putIfAbsent(r.talhao, () => []).add(r);
  }
  porTalhao.forEach((t, lista) {
    print('J2: Histórico de $t:');
    for (var r in lista) print('  ${r.data.toIso8601String().split('T').first} - ${r.atividade} ${r.observacao ?? ''}');
  });

  // J3: receita estimada com consulta assíncrona
  double totalReceita = 0.0;
  for (var t in talhoes) {
    try {
      final preco = await consultaCotacaoSimulada(t['cultura'] as String);
      final rec = receitaBrutaTalhao(t['area'] as double, 50.0, preco); // produtividade simulada 50
      totalReceita += rec;
      print('J3: ${t['nome']} receita estimada = R\$ ${rec.toStringAsFixed(2).replaceAll('.', ',')}');
    } catch (e) {
      print('J3: falha na cotação para ${t['nome']}: $e');
    }
  }
  print('J3: receita total estimada = R\$ ${totalReceita.toStringAsFixed(2).replaceAll('.', ',')}');
}
