import 'package:ejemplo_provider/Paginas/controlador/login_controller.dart';
import 'package:ejemplo_provider/Paginas/controlador/service_locator.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_js/flutter_js.dart';
//import 'package:flutter_js/javascript_runtime.dart';
import 'package:get/get.dart';
import 'dart:js' as js;
import 'package:simple_auth/simple_auth.dart';


class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Listar Sesiones'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //TutorMenu(),
              Boton(),
            ],
          ),
        ),
      ),
    );
  }
}


class Boton extends StatelessWidget{
  //JavascriptRuntime flutterJs = getJavascriptRuntime();
  @override
  Widget build(BuildContext context){
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_){
        return Form(
          child: Column(
            children: [
              TextButton(
                onPressed: (){
                  //js.context.callMethod('signIn', []);

                  _.loggear();
                }, 
                child: Text('Log In')
              ),
              Text('Numero: '+_.numero.toString()),
              TextButton(
                onPressed: (){
                  _.imp();
                }, 
                child: Text('ver cuenta')
              ),
            ],
          )
        );
      }
    );
  }
}