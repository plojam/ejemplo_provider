import 'package:ejemplo_provider/Paginas/mantener_datos/general.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Puno extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<General>(
      init: General(),
      builder: (_){
        return Column(
          children: [
            Text('Numro: ' + General.numero.toString()),
            TextButton(
              onPressed: (){
                _.aumentar();
              }, 
              child: Text('AAAA')

            ),
            TextButton(
              onPressed: (){
                Navigator.pushNamed(context, '/paginados');
              },
              child: Text("Ir a pagina 2")
            ),
          ],
        );
      }
    );
  }
}