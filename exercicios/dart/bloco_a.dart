import 'dart:math';

void main() {
  exA1();
  exA2();
  exA3();
  exA4();
  exA5();
}

// A1: Declarando com tipos explícitos
void exA1() {
  String produtor = "João Silva";
  String cidade = "Rio Verde";
  double areaHectares = 150.5;
  int anoSafra = 2023;

  print("A1 - Produtor: $produtor, Cidade: $cidade, Área: $areaHectares ha, Safra: $anoSafra");
}

// A2: Refazendo com var e inferência de tipos
void exA2() {
  var produtor = "Maria Souza"; // Tipo inferido: String
  var cidade = "Jataí";         // Tipo inferido: String
  var areaHectares = 200.0;     // Tipo inferido: double
  var anoSafra = 2024;          // Tipo inferido: int

  print("A2 - Produtor: $produtor, Cidade: $cidade, Área: $areaHectares ha, Safra: $anoSafra");
}

// A3: Const vs Final
void exA3() {
  const double alqueireGoiano = 4.84;
  final DateTime dataExecucao = DateTime.now();

  /* 
     Explicação: 
     O erro ao tentar trocar 'final' por 'const' para DateTime.now() ocorre porque 
     'const' exige que o valor seja conhecido em tempo de compilação (compile-time constant).
     Como o 'DateTime.now()' é uma função executada apenas em tempo de execução (runtime), 
     o compilador não consegue determinar seu valor antes do programa rodar. 
     'final' permite que o valor seja atribuído uma única vez durante a execução.
  */
  print("A3 - Alqueire: $alqueireGoiano ha, Executado em: $dataExecucao");
}

// A4: Conversão de área
void exA4() {
  double hectares = 500.0;
  double alqueire = 4.84;
  double resultado = hectares / alqueire;

  print("A4 - $hectares hectares equivalem a ${resultado.toStringAsFixed(2)} alqueires goianos.");
}

// A5: Cotações e cálculos
void exA5() {
  double c1 = 120.50, c2 = 145.20, c3 = 115.80;

  // Encontrando o maior e menor
  double maior = (c1 > c2 ? c1 : c2) > c3 ? (c1 > c2 ? c1 : c2) : c3;
  double menor = (c1 < c2 ? c1 : c2) < c3 ? (c1 < c2 ? c1 : c2) : c3;
  double media = (c1 + c2 + c3) / 3;

  print("A5 - Cotações: $c1, $c2, $c3");
  print("Maior: ${maior.toStringAsFixed(2)}");
  print("Menor: ${menor.toStringAsFixed(2)}");
  print("Média: ${media.toStringAsFixed(2)}");
}