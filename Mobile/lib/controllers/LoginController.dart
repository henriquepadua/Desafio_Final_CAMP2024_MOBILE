import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  Future<Map<String, dynamic>?> fazerLoginUsuario(
      String senha, String email) async {
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
        var responseBody = jsonDecode(response.body);
        var todosUsuarios = await http.get(
          Uri.parse("https://projeto-sementes.onrender.com/usuarios"),
          headers: headers,
        );
        var responseBodyUsuarios = jsonDecode(todosUsuarios.body);
        // Extract user information from the response
        for (var responsebody in responseBodyUsuarios) {
          if (responsebody['email'] == email) {
            return {
              'name': responsebody['nome'],
              'id': responsebody['id'],
              'cargo': responsebody['cargo'],
            };
          }
        }
      } else {
        return null;
      }
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }
}


// import 'dart:async';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:dio/dio.dart';

// class LoginController {
//   final dio = Dio();

//   Future<bool> fazerLoginUsuario(String senha, String email) async {
//     const String apiUrl =
//         "https://projeto-sementes.onrender.com/usuarios/login";

//     final Map<String, String> headers = {
//       'Content-Type': 'application/json; charset=UTF-8',
//     };

//     final Map<String, String> data = {
//       "email": email,
//       "password": senha,
//     };

//     try {
//       var response = await http.post(
//         Uri.parse(apiUrl),
//         headers: headers,
//         body: jsonEncode(data),
//         encoding: Encoding.getByName("utf-8"),
//       );

//       if (response.statusCode == 201) {
//         return true;
//       } else {
//         return false;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
// }