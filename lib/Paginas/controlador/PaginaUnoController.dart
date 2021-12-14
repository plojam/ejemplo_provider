// ignore_for_file: file_names

import 'package:flutter/material.dart';

class PaginaUnoController {

  final buttonNotifier = ValueNotifier<buttonState>(buttonState.original);

  String texto1 = 'hola';
  

  void reemplazoTexto(String texto){
    this.texto1 = texto;
  }

  void cambiarTexto(){


    if(buttonNotifier.value == buttonState.original){
      buttonNotifier.value = buttonState.cambiado;
      //texto1 = 'adios';
    }else if(buttonNotifier.value == buttonState.cambiado){
      buttonNotifier.value = buttonState.original;
      //texto1='hola';
    }
    //print('se cambia el texto');
  }

}

enum buttonState{
  original,
  cambiado,
}