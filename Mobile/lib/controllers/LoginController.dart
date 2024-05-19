import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:bcrypt/bcrypt.dart';

class LoginController {
  final dio = Dio();

  Future<bool> fazerLoginUsuario(String senha, String email) async {
    const String apiUrl =
        "https://projeto-sementes.onrender.com/usuarios/login";

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final Map<String, String> data = {
      "email": email,
      "password": senha,
    };

    try {
      var response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: jsonEncode(data),
        encoding: Encoding.getByName("utf-8"),
      );

      if (response.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}