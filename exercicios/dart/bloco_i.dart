// Bloco I — Código assíncrono
import 'dart:async';

Future<double> lerSensorUmidade() async {
  await Future.delayed(const Duration(seconds: 2));
  return 42.5; // valor simulado
}

void main() async {
  print('--- Bloco I ---');
  print('I1: antes da leitura');
  final valor = await lerSensorUmidade();
  print('I1: valor lido = $valor');

  // I2: chamar sem await
  final futuro = lerSensorUmidade();
  print('I2: sem await devolveu: $futuro');
  // Comentário: acima aparece um Future, porque a função retorna imediatamente um Future

  // I3: três leituras sequenciais vs simultâneas
  final sw = Stopwatch()..start();
  await lerSensorUmidade();
  await lerSensorUmidade();
  await lerSensorUmidade();
  sw.stop();
  print('I3: tempo sequencial: ${sw.elapsedMilliseconds} ms');

  final sw2 = Stopwatch()..start();
  await Future.wait([lerSensorUmidade(), lerSensorUmidade(), lerSensorUmidade()]);
  sw2.stop();
  print('I3: tempo paralelo (Future.wait): ${sw2.elapsedMilliseconds} ms');
}
