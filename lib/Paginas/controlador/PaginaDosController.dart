// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get.dart';

class PaginaDosController extends GetxController {

  var contador = 0.obs;

  var texto = "".obs;
  final textofield = TextEditingController();

  void incrementar(){
    this.contador.value++;
  }

  void reemplazarTexto(){
    this.texto.value = textofield.text;
  }

}
