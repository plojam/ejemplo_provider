
import 'package:ejemplo_provider/Paginas/mantener_datos/pdos.dart';
import 'package:ejemplo_provider/Paginas/mantener_datos/puno.dart';
import 'package:ejemplo_provider/Paginas/vista/PaginaDos.dart';
import 'package:ejemplo_provider/Paginas/vista/PaginaUno.dart';
import 'package:ejemplo_provider/Paginas/vista/auth.dart';
import 'package:ejemplo_provider/Paginas/vista/login.dart';
import 'package:ejemplo_provider/main.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';


class RoutePagina {
  static FluroRouter router = FluroRouter();

  

  static Handler _emptyHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params){
      return MyApp();
    }
  );

  static Handler _punoHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return PaginaUno();
    }
  );

  static Handler _pdosHandler = new Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return PaginaDos();
    }
  );

  static Handler _login = new Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return Login();
    }
  );

  static Handler _auth = new Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return Auth();
    }
  );

  static Handler _unoHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return Puno();
    }
  );

  static Handler _dosHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, dynamic> params){
      return Pdos();
    }
  );






  static void configureRoutes() {
    router.define('/paginauuno', handler: _punoHandler);
    router.define('/paginadoos', handler: _pdosHandler);
    router.define('/login', handler: _login);
    router.define('/auth', handler: _auth);
    router.define('/uno', handler: _unoHandler);
    router.define('/dos', handler: _dosHandler);
      router.notFoundHandler = _emptyHandler;
  }
}