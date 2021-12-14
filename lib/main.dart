import 'package:ejemplo_provider/Paginas/mantener_datos/puno.dart';
import 'package:ejemplo_provider/Paginas/routes/router.dart';
import 'package:ejemplo_provider/Paginas/vista/PaginaDos.dart';
import 'package:ejemplo_provider/Paginas/vista/PaginaUno.dart';
import 'package:ejemplo_provider/Paginas/controlador/service_locator.dart';
import 'package:ejemplo_provider/Paginas/vista/api_vista.dart';
import 'package:ejemplo_provider/Paginas/vista/login.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  
  //router
  //agregarle para que comience a funcionar
  RoutePagina.configureRoutes();
  

  //para quitar el # en la ruta del navegador
  setPathUrlStrategy();
  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Adaptado equis de',
        //agregar para cuando se quiera usar el fluro
        initialRoute: 'login',
        onGenerateRoute: RoutePagina.router.generator,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
      );
  }
}
