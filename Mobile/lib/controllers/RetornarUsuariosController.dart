import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class RetornarUsuariosController {
  final dio = Dio();

  Future<void> pegarTodosUsuarios() async {
    const String apiUrl =
        "https://projeto-sementes.onrender.com/usuarios";

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    try {
      var response = await http.get(
        Uri.parse(apiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        print(response.body);
        print( "true");
      } else {
        print( "false");
      }
    } catch (e) {
      print( "false");
    }
  }
}
