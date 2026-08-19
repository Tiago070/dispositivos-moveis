// Bloco F — Funções

void main() {
  print('--- Bloco F ---');
  print('F1: ${f1_hectaresParaAlqueires(10)}');
  print('F1(arrow): ${f1_arrow(10)}');
  print('F2a: ${f2_formatNumber(1234.567)}');
  print('F2b: ${f2_formatNumber(1234.567, 3)}');
  f3_comParametrosNomeados(area: 50, nome: 'Sítio Alegre');
  f4_aplicarTransformacoes([10.0, 20.0, 30.0], (v) => v * 2);
  f4_aplicarTransformacoes([10.0, 20.0, 30.0], (v) => v / 2.42);
  print('F5: receita = ${f5_receitaBruta(area: 10, produtividade: 50, precoSaca: 128.4)}');
}

// F1: função que converte hectares para alqueires + versão arrow
double f1_hectaresParaAlqueires(double ha) {
  return ha / 2.42;
}

double f1_arrow(double ha) => ha / 2.42;

// F2: formatação com casas decimais opcionais (padrão 1)
String f2_formatNumber(num n, [int casas = 1]) {
  return n.toStringAsFixed(casas).replaceAll('.', ',');
}

// F3: parâmetros nomeados: nome e área obrigatórios, cultura default
void f3_comParametrosNomeados({required String nome, required double area, String cultura = 'Soja'}) {
  print('F3: $nome - $area ha - $cultura');
}

// F4: recebe lista de áreas e função de transformação
void f4_aplicarTransformacoes(List<double> areas, double Function(double) transform) {
  for (var a in areas) {
    print('F4: ${transform(a)}');
  }
}

// F5: receita bruta com parâmetros nomeados e obrigatórios
double f5_receitaBruta({required double area, required double produtividade, required double precoSaca}) {
  return area * produtividade * precoSaca;
}
