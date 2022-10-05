import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:test/test.dart';

void main() {
  group('Registro de raza correcto', () {
    final registro = RegistroRaza.constructor(
        propuestaRaza: "razaejemplo",
        propuestaSubRazas: ["subRaza1", "subRaza2"]);

    final registroSinSubRaza = RegistroRaza.constructor(
        propuestaRaza: "razaEjemplo2", propuestaSubRazas: []);

    test('CheckRegistroRaza', () {
      expect(registro.propuestaRaza, equals("razaejemplo"));
    });
    test('CheckSubRazas', () {
      expect(registro.propuestaSubRazas.contains("subRaza1"), true);
    });
    test('Check Registro sin sub raza', () {
      expect(registro.propuestaSubRazas.isEmpty(), true);
    });
  });
}