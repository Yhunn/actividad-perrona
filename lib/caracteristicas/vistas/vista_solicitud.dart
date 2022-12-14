import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:actividad_perrona/caracteristicas/verificacion/bloc.dart';

class VistaSolicitudRaza extends StatefulWidget {
  const VistaSolicitudRaza({super.key});

  @override
  State<VistaSolicitudRaza> createState() => _VistaSolicitudRazaState();
}

class _VistaSolicitudRazaState extends State<VistaSolicitudRaza> {
  bool _usuarioValidado = false;
  late final TextEditingController controlador;

  @override
  void initState() {
    controlador = TextEditingController();
    controlador.addListener(escuchandoValidador);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: SizedBox(
            width: 500,
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Escribe el nombre de una raza a buscar',
              ),
              controller: controlador,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
            style: ButtonStyle(
              foregroundColor: _usuarioValidado
                  ? MaterialStateProperty.all<Color>(Colors.black)
                  : MaterialStateProperty.all<Color>(Colors.grey),
            ),
            onPressed: _usuarioValidado
                ? () {
                    var bloc = context.read<BlocDogVerification>();
                    bloc.add(NombreRazaRecibido(controlador.text));
                  }
                : null,
            child: const Text('Ingresar')),
      ]),
    );
  }

  void escuchandoValidador() {
    setState(() {
      try {
        Validador(controlador.text);
        _usuarioValidado = true;
      } catch (e) {
        _usuarioValidado = false;
      }
    });
  }
}

class Validador {
  late final String value;
  Validador(String propuesta) {
    if (!(propuesta.trim().isNotEmpty)) {
      throw RazaError();
    }
    value = propuesta;
  }
}

class RazaError implements Exception {}
