import 'package:ejemplo_provider/Paginas/controlador/compartido.dart';
import 'package:ejemplo_provider/Paginas/controlador/login_controller.dart';
import 'package:ejemplo_provider/Paginas/mantener_datos/general.dart';
import 'package:ejemplo_provider/Paginas/vista/PaginaUno.dart';
import 'package:ejemplo_provider/Paginas/controlador/PaginaUnoController.dart';
import 'package:get_it/get_it.dart';


final getIt = GetIt.instance;

void setupGetIt() {
  
  getIt.registerLazySingleton<PaginaUno>(() => PaginaUno());

  getIt.registerLazySingleton<PaginaUnoController>(() => PaginaUnoController());

  getIt.registerLazySingleton<Compartido>(() => Compartido());

  getIt.registerLazySingleton<LoginController>(() => LoginController());

  getIt.registerLazySingleton<General>(() => General());

}