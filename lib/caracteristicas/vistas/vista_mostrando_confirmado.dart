import 'package:actividad_perrona/dominio/registro_raza.dart';
import 'package:flutter/material.dart';

class VistaMostrandoRazaConfirmada extends StatelessWidget {
  const VistaMostrandoRazaConfirmada({super.key, required this.registro});
  final RegistroRaza registro;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Se encontró la raza: ${registro.nombreRaza}"),
          registro.subRazas.match((l) {
            return Text(l);
          }, (r) {
            String todasLasSubRazas = "Tiene las siguientes subrazas:\n";
            r.forEach((element) {
              todasLasSubRazas += "$element\n";
            });
            return Text(todasLasSubRazas);
          }),
        ],
      ),
    );
  }
}
