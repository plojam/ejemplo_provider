
import 'package:ejemplo_provider/Paginas/api/user.api.dart';
import 'package:ejemplo_provider/Paginas/modelo/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/state_manager.dart';

class ApiController extends GetxController{
  int _counter =0;
  List<User> _users = [];

  List<User> get user => _users;

  int get counter => _counter;

  @override
  void onInit() {
    super.onInit();
    print("Igual a initState");
  }

  @override
  void onReady() {
    super.onReady();
    print("igual a onReady");
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await User_api.instace.fetch_user(_counter);
    this._users = data!;
    update(['resultados']);
  }

  void incrementar(){
    this._counter++;
    this.loadUsers();
    //update(['resultados']);
  }

  void decrementar(){
    if(_counter>1){
      this._counter--;
      this.loadUsers();
    }
    //update(['resultados']);
  }

  void cuadro(){
    print('llega al gialogo');
    Get.dialog(
      AlertDialog(
        title: Text('Hola que hace'),
        content: Text('Descripcion del hola que hace'),
        actions: [
          TextButton(
            onPressed: (){
              Get.back();
            } ,
            child: Text('Aceptar'),  
          ),
        ],
      ),
    );
    print('sale del dialogo');
  }
}