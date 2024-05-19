import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:bcrypt/bcrypt.dart';

class CadastroController {
  final dio = Dio();

  Future<String> fazerCadastroUsuario(
      String senha, String email, String nome, String cargo) async {
    const String apiUrl =
        "https://projeto-sementes.onrender.com/usuarios/register";

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final Map<String, String> data = {
      "nome": nome,
      "email": email,
      "password": senha,
      "cargo": cargo
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 201) {
        print(response.body);
        return "true";
      } else {
        return "false";
      }
    } catch (e) {
      return "false";
    }
  }
}
