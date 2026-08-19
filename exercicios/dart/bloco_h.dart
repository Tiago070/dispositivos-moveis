// Bloco H — Enums e exceções

enum Atividade { plantio, adubacao, pulverizacao, colheita }

void main() {
  print('--- Bloco H ---');
  print('H1: ' + atividadeDescricao(Atividade.plantio));
  // H2: enum com campos (implementado abaixo como AtividadeCampos)
  for (var a in AtividadeCampos.values) {
    print('${a.name} - ${a.rotulo} - exige registro? ${a.exigeRegistro}');
  }

  // H3/H4: validar área com try/catch/finally
  try {
    validarArea(10);
    validarArea(0); // provocará erro
  } catch (e) {
    print('Capturado erro: $e');
  } finally {
    print('Finally executado');
  }
}

// H1: switch que devolve descrição
String atividadeDescricao(Atividade at) {
  switch (at) {
    case Atividade.plantio:
      return 'Plantio: preparação e semeadura';
    case Atividade.adubacao:
      return 'Adubação: aplicação de corretivos e fertilizantes';
    case Atividade.pulverizacao:
      return 'Pulverização: controle de pragas/doenças';
    case Atividade.colheita:
      return 'Colheita: colheita e armazenamento';
  }
}

// H2: enum com campos
enum AtividadeCampos {
  plantio('Plantio', false),
  adubacao('Adubação', false),
  pulverizacao('Pulverização', true),
  colheita('Colheita', false);

  final String rotulo;
  final bool exigeRegistro;
  const AtividadeCampos(this.rotulo, this.exigeRegistro);
}

// H3: validar área — lança ArgumentError quando <= 0
void validarArea(double area) {
  if (area <= 0) throw ArgumentError.value(area, 'area', 'Deve ser maior que zero');
  print('Área $area válida');
}
