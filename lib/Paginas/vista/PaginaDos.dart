// ignore_for_file: file_names

import 'package:ejemplo_provider/Paginas/controlador/PaginaDosController.dart';
import 'package:ejemplo_provider/Paginas/controlador/PaginaUnoController.dart';
import 'package:ejemplo_provider/Paginas/controlador/compartido.dart';
import 'package:ejemplo_provider/Paginas/controlador/login_controller.dart';
import 'package:ejemplo_provider/Paginas/controlador/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
  
class PaginaDos extends StatelessWidget {
  final PaginaDosController controlador = Get.put(PaginaDosController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Pagina con obx'),
        ),
        body: Center(
          child: Column(
            children: [
              Obx(() => Text(
                      'El valor actual es: ${controlador.contador.value}'
                  ),
              ),
              Obx(() => Text(
                      'El texto ingresado es: ${controlador.texto.value}'
                  ),
              ),
              TextField(
                obscureText: false,
                controller: controlador.textofield,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Escribir algo aqui',
                ),
              ),
              TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/paginauuno');
                }, 
                child: Text('Ir a pagina uno')
              ),
              FloatingActionButton(
                onPressed: () {
                  controlador.incrementar();
                  controlador.reemplazarTexto();
                },
                child: Icon(Icons.play_arrow),
              ),
              GetBuilder<LoginController>(
                init: LoginController(),
                builder: (_){
                  return Column(
                    children: [
                    Text('El valor actual es: ${Compartido.numero}'),
                    TextButton(
                      onPressed: (){
                        _.imp();
                      }, 
                      child: Text('Comprobar Inicio')
                    ),
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


/*
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
              TextField(
                obscureText: true,
                controller: stateManager.textofield,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              )
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
          stateManager.textofield.text,
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
}*/