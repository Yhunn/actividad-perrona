import 'package:actividad_perrona/caracteristicas/verificacion/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:actividad_perrona/caracteristicas/vistas/vista_creandose.dart';

void main() {
  runApp(const BlocApplication());
}

class BlocApplication extends StatelessWidget {
  const BlocApplication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context){
        BlocDogVerification blocDogVerification = BlocDogVerification();
        return blocDogVerification;
      },
      child: const Aplicacion(),
    );
  }
}

class Aplicacion extends StatelessWidget {
  const Aplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Builder(builder: (context){
          var estado = context.watch<BlocDogVerification>().state;
          if(estado is EstadoCreado){
            return const VistaCreandose();
          }
          return const Center(child: Text("No hay soporte para esta acción"));
        }),
      ),
    );
  }
}