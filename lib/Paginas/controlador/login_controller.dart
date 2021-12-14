import 'package:ejemplo_provider/Paginas/controlador/compartido.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:msal_js/msal_js.dart';

class LoginController extends GetxController{

  var numero = 0;

  Configuration? con;
  PublicClientApplication? publicClientApp;

  static get auth => null;
  @override
  void onInit(){
    super.onInit();
    

    Compartido.con = Configuration();
    con = Configuration();
    var brau = BrowserAuthOptions();
    brau.clientId = '869053c3-e7c4-4bac-b68b-5123e112a77f';
    brau.redirectUri = "http://localhost:64790/auth";
    Compartido.con?.auth = brau;
    con?.auth = brau;
  }
  


  Future<void> loggear() async {
    publicClientApp = PublicClientApplication(con!);
    

    final loginRequest = RedirectRequest()..scopes = ['user.read'];


    publicClientApp!.loginRedirect(loginRequest);
    print('llega aca despuess');

    print(publicClientApp!.getLogger);

    print('1');
/*
    if (publicClientApp!.getAllAccounts().isEmpty) {
      // No users are authenticated, a user will need to be logged in
      // first before we can continue
      return;
    }*/

    print('2');

    try {
      // Try to get a token silently
      final silentRequest = SilentRequest()..scopes = ['user.read'];

      print('3');

      final AuthenticationResult silentResult = 
          await publicClientApp!.acquireTokenSilent(silentRequest); //tal vez si este dato se guarda en un archivo

      print('4');

      print(silentResult.accessToken);

      // Silent token request successful,
      // access token is available at silentResult.accessToken
    } on InteractionRequiredAuthException {
      // Interactive prompt is required

      // This example will use a popup, but acquireTokenRedirect
      // could be called here instead
      try {
        print('e1');
        final interactiveRequest = PopupRequest()..scopes = ['user.read'];

        print('e2');

        final AuthenticationResult interactiveResult =
            await publicClientApp!.acquireTokenPopup(interactiveRequest);

        print('e3');

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