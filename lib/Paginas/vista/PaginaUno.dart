// ignore_for_file: file_names

import 'package:ejemplo_provider/Paginas/controlador/PaginaUnoController.dart';
import 'package:ejemplo_provider/Paginas/controlador/compartido.dart';
import 'package:ejemplo_provider/Paginas/controlador/login_controller.dart';
import 'package:ejemplo_provider/Paginas/controlador/service_locator.dart';
import 'package:ejemplo_provider/Paginas/routes/router.dart';
import 'package:ejemplo_provider/Paginas/vista/PaginaDos.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
  
class PaginaUno extends StatefulWidget {
  @override
  _PaginaUnoState createState() => _PaginaUnoState();
  
}

class _PaginaUnoState extends State<PaginaUno>{
  final stateManager = getIt<PaginaUnoController>();


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primer Pagina'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //Text(stateManager.texto1),
              MostrarTexto(),
              MostrarBoton(),
              CupertinoTextField(
                obscureText: false,
                onChanged: stateManager.reemplazoTexto,
              ),
              TextButton(
                onPressed: (){
                  //RoutePagina.router.navigateTo(context, 'paginadoos'); // -> con esto en la pagina aparece una flecha para regresar que no se puede quitar
                  //Navigator.pushReplacementNamed(context, '/paginadoos');
                  Navigator.pushNamed(context, '/paginadoos');
                  //Navigator.pushNamedAndRemoveUntil(context, '/paginadoos', (route) => false);
                  // Navigator.popAndPushNamed(context, '/paginadoos');
                  // Navigator.restorablePushNamedAndRemoveUntil(context, '/paginadoos', (route) => false);
                  //Navigator.restorablePopAndPushNamed(context, '/paginadoos');
                  // Navigator.restorablePushReplacementNamed(context, '/paginadoos');
                  //Navigator.restorablePushNamed(context, '/paginadoos');
                },
                child: Text("Ir a pagina 2")
              ),
              GetBuilder<LoginController>(
                init: LoginController(),
                builder: (_){
                  return Column(
                    children: [
                      TextButton(
                        onPressed: (){
                          _.loggear();
                        }, 
                        child: Text('Aumetnar')
                      ),
                      Text('El valor actual es: ${Compartido.numero}'),
                    ],
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MostrarTexto extends StatelessWidget {
  const MostrarTexto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<PaginaUnoController>();
    return ValueListenableBuilder<buttonState>(
      valueListenable: stateManager.buttonNotifier,
      builder: (context, estodoBoton, child) {
        return Text(
          stateManager.texto1,
        );
      },
    );
  }
}

class MostrarBoton extends StatelessWidget{
  const MostrarBoton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        //print("llega al boton");
        final stateManager = getIt<PaginaUnoController>();
        stateManager.cambiarTexto();
        //print("sale del boton");
      },
      child: Icon(Icons.play_arrow),
    );
  }
}