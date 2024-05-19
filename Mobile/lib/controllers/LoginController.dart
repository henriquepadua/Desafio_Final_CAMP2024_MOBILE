import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:bcrypt/bcrypt.dart';

class LoginController {
  final dio = Dio();

  Future<void> criandoUsuariosCadastrados() async {
  final String apiUrl = "https://projeto-sementes.onrender.com/usuarios/login";
  final Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJjMDJkZmY5Ny0wMTUwLTQzMzItYThhNC1lNjZjMjQ5NTg0MjMiLCJpYXQiOjE3MTYxNDczMDgsImV4cCI6MTcxNjE1MDkwOH0.ZB2yRTWdKO3jimDjbhp7dUoVOtzyYRRl8AyIGR1YltI',
  };

  final Map<String, String> data = {
    "username": "henrique6@example.com",
    "password": "123456789",
  };

  try {
    var response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(data),
      encoding: Encoding.getByName("utf-8"),
    );

    print('Request Headers: ${response.request?.headers}');
    print('Request Body: ${response.body}');
    print('Request URL: ${response.request?.url}');

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('Failed with status code: ${response.statusCode}');
      print('Response body: ${response.body}');
    }
  } catch (e) {
    print('Exception: $e');
  }
}

  Future<bool> fazerLogin(String senha, String email) async {
    try {
      var response = await http.get(
        Uri.parse("https://projeto-sementes.onrender.com/usuarios/login"),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        var usuario = jsonDecode(jsonEncode(response));
        for (var verificaUsusario in usuario['senha']) {
          // if (testandoSenhaCriptografada("123",
          //     r"$2b$10$Fnjx6yRAOVYO2/SV59la0.luOMAxh0TC1LGj8hoZw141t0ykiGYmS"))
          //   ;
        } //.contains(senha);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return true;
    }
  }
}
