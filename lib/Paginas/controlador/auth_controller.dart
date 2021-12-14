import 'package:ejemplo_provider/Paginas/controlador/compartido.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msal_js/msal_js.dart';

class AuthController extends GetxController{

  var numero = 0;


/*
  static get auth => null;
  @override
  void onInit(){
    super.onInit();
    

    Compartido.con = Configuration();
    con = Configuration();
    var brau = BrowserAuthOptions();
    brau.clientId = '869053c3-e7c4-4bac-b68b-5123e112a77f';
    brau.redirectUri = "http://localhost:64790/paginadoos";
    Compartido.con?.auth = brau;
    con?.auth = brau;
  }*/
  


  Future<void> loggear() async {
    if (Compartido.publicClientApp!.getAllAccounts().isEmpty) {
      // No users are authenticated, a user will need to be logged in
      // first before we can continue
      return;
    }

    try {
      // Try to get a token silently
      final silentRequest = SilentRequest()..scopes = ['user.read'];

      final AuthenticationResult silentResult = 
          await Compartido.publicClientApp!.acquireTokenSilent(silentRequest);

      // Silent token request successful,
      // access token is available at silentResult.accessToken
    } on InteractionRequiredAuthException {
      // Interactive prompt is required

      // This example will use a popup, but acquireTokenRedirect
      // could be called here instead
      try {
        final interactiveRequest = PopupRequest()..scopes = ['user.read'];

        final AuthenticationResult interactiveResult =
            await Compartido.publicClientApp!.acquireTokenPopup(interactiveRequest);

        // Interactive token request successful,
        // access token is available at interactiveResult.accessToken
      } on AuthException catch (ex) {
        // Interactive request failed, see ex for more info
      } 
    } on AuthException catch (ex) {
      // Silent request failed, but not because interaction is required,
      // see ex for more info
    } 
  }

  imp() {
    print(Compartido.numero);
    print('hola');
    print(Compartido.publicClientApp!.getActiveAccount);
  }  



  final textCorreo = TextEditingController();
  final textContrasena = TextEditingController();

  void comprobarLogin(BuildContext context){

    /*
    if(textCorreo.text == 'administrador' && textContrasena.text == 'administrador'){
      loginNotifier.value = loginState.correcto;
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>AdministradorInicio()));
    }else if(textCorreo.text == 'tutor' && textContrasena.text == 'tutor'){
      loginNotifier.value = loginState.correcto;
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>AdministradorInicio()));
    }else if(textCorreo.text == 'tutorado' && textContrasena.text == 'tutorado'){
      loginNotifier.value = loginState.correcto;
      //Navigator.push(context,MaterialPageRoute(builder: (context)=>AdministradorInicio()));
    }else {
      loginNotifier.value = loginState.incorrecto;
    }*/
  }
}