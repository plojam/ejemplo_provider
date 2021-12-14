import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class General extends GetxController{
  
  static var numero = 0;

  aumentar(){
    numero++;
  }

  guardar() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    
  }
}