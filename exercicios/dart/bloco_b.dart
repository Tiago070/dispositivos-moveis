void main() {
  // Chamada dos exercícios
  b1();
  b2();
  print("Resultado B3: ${b3(15.5)}");
  b4();
  // b5(); // Comentado para não interromper a execução dos outros exercícios
}

// B1: Declare String? telefone sem valor inicial e imprima-a usando ??
void b1() {
  String? telefone;
  print("B1: ${telefone ?? 'não informado'}");
}

// B2: Tente imprimir telefone.length diretamente e corrija usando ?.
void b2() {
  String? telefone;
  
  // Mensagem de erro ao tentar imprimir telefone.length:
  // "The property 'length' can't be unconditionally accessed because the receiver can be 'null'."
  
  print("B2: ${telefone?.length}");
}

// B3: Função que avalia chuvaMm
String b3(double? chuvaMm) {
  if (chuvaMm == null) return "sem registro";
  return chuvaMm < 20 ? "seca" : "normal";
}

// B4: Cálculo de sacas por hectare com retorno double?
double? calcularSacas(double sacas, double area) {
  if (area <= 0) return null;
  return sacas / area;
}

void b4() {
  double? resultado = calcularSacas(100, 0);
  if (resultado != null) {
    print("B4: Resultado = $resultado");
  } else {
    print("B4: Área inválida, impossível calcular.");
  }
}

// B5: Forçar quebra com operador !
void b5() {
  String? valorNulo;
  print(valorNulo!); 
  
  /* 
   Mensagem de erro de execução:
   "Uncaught TypeError: Cannot read properties of null (reading 'runtimeType')" 
   ou "Null check operator used on a null value"
   
   Por que evitar: O operador ! (bang operator) força o compilador a ignorar a segurança 
   contra nulos. Se o valor for realmente nulo em tempo de execução, o programa irá 
   travar (crashar), quebrando a aplicação e comprometendo a estabilidade.
  */
}