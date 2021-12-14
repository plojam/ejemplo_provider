import 'package:ejemplo_provider/Paginas/controlador/api_controller.dart';
import 'package:ejemplo_provider/Paginas/modelo/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiVista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApiController>(
      init: ApiController(),
      builder: (_) {
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                GetBuilder<ApiController>(
                  id: 'resultados',
                  builder: (_){
                    return Text(_.counter.toString());
                  }
                ),
                
                TextButton(
                  onPressed: (){
                    _.incrementar();
                  }, 
                  child: Text('Cargar siguiente'),
                ),
                TextButton(
                  onPressed: (){
                    _.decrementar();
                  }, 
                  child: Text('Cargar anterior'),
                ),
                GetBuilder<ApiController>(
                  id: 'resultados',
                  builder: (_){
                    print('llega3');
                    return ListView.builder(
                      shrinkWrap: true,
                      //physics: ScrollPhysics(),
                      itemBuilder: (context, index){
                        final User user = _.user[index];
                        return ListTile(
                          title: Text(user.firstName),
                          subtitle: Text(user.email),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: (){
                              //items.remove(index);
                              //y en el controlador deberia ir
                              /*
                              void removeItem(int index){
                                items.removeAt(index); //->items seria la variable ded la lista
                              }
                              */
                            },
                          ),

                        );
                      },
                      itemCount: _.user.length,
                    );
                    
                  }
                ),
                TextButton(
                  onPressed: (){
                    _.cuadro();
                  }, 
                  child: Text('Mostrar cuadro de error o algo asi'),
                ),
              ],
            ),
          ),
          
          
                
          
        );
      }
    );
  }
}