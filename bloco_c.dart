void main() {
  c1();
  c2();
  c3();
  c4();
}

// 1. Usando interpolação, monte e imprima a frase "O Talhão 3 tem 42,0 ha plantados com milho"
void c1() {
  int talhao = 3;
  double area = 42.0;
  String cultura = "milho";

  print("O Talhão $talhao tem ${area.toStringAsFixed(1).replaceAll('.', ',')} ha plantados com $cultura");
}

// 2. Imprima um valor monetário no formato brasileiro
void c2() {
  double valor = 1250.50;
  // Explicação: toStringAsFixed(2) garante duas casas decimais. 
  // O replaceAll troca o ponto original do double pela vírgula usada no Brasil.
  // O cifrão é escapado com a barra invertida \ para aparecer no texto.
  String valorFormatado = "R\$ ${valor.toStringAsFixed(2).replaceAll('.', ',')}";
  print(valorFormatado);
}

// 3. Crie um texto de várias linhas com o endereço completo de uma cooperativa
void c3() {
  String endereco = '''
Cooperativa Agroindustrial
Rua das Sementes, 123
Bairro Rural, Cidade Verde - PR
CEP: 87000-000
''';
  print(endereco);
}

// 4. A partir da string ' soja , milho , sorgo ', produza uma lista com as três culturas
void c4() {
  String entrada = ' soja , milho , sorgo ';
  
  // Explicação: 
  // 1. split(',') divide a string baseada na vírgula.
  // 2. map(s) => s.trim() remove os espaços em branco de cada elemento.
  // 3. map(s) => s.toUpperCase() coloca em letras maiúsculas.
  // 4. toList() converte o iterável resultante em uma lista de strings.
  List<String> culturas = entrada
      .split(',')
      .map((item) => item.trim().toUpperCase())
      .toList();

  print(culturas); // Saída: [SOJA, MILHO, SORGO]
}