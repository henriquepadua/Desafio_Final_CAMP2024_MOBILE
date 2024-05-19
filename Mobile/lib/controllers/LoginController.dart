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
    const String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMDJkZmY5Ny0wMTUwLTQzMzItYThhNC1lNjZjMjQ5NTg0MjMiLCJpYXQiOjE3MTYxNDczMDgsImV4cCI6MTcxNjE1MDkwOH0.ZB2yRTWdKO3jimDjbhp7dUoVOtzyYRRl8AyIGR1YltI';

    final Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
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

      print('Request Headers: ${response.request?.headers}');
      print('Response Body: ${response.body}');
      print('Request URL: ${response.request?.url}');

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