

import 'package:dio/dio.dart';
import 'package:ejemplo_provider/Paginas/modelo/user.dart';


class User_api {

  User_api._internal();

  static User_api _instance = User_api._internal();
  static User_api get instace => _instance;

  final _dio = Dio();

  Future<List<User>?> fetch_user(int page) async {
    try {
      final Response response = await this._dio.get('https://reqres.in/api/users', 
      queryParameters: {
        "page": page,
        },
      );

      return (response.data['data'] as List)
      .map((e) => User.fromJson(e))
      .toList();

    } catch (e) {
      print(e);
      return null;
    }
  }





  
}