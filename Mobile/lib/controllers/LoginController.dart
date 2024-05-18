import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:bcrypt/bcrypt.dart';

class LoginController {
  final dio = Dio();

  void testandoSenhaCriptografada() {
  // Hash bcrypt fornecido
  String hashedPassword = r'$2b$10$t6nKPBIJNE8sMTklrsZAR.lNC/IvnopT7PiMvr33V.sF57LgYCZIe';

  // Senha que você deseja verificar
  String password = '123'; // Substitua pela senha que você deseja verificar

  // Verifica se a senha corresponde ao hash
  bool isPasswordCorrect = BCrypt.checkpw(password, hashedPassword);

  if (isPasswordCorrect) {
    print('A senha está correta!');
  } else {
    print('A senha está incorreta.');
  }
}

  Future<void> testarConexao() async {
  try {
    var response = await dio.get("https://dart.dev");
    //Uri.parse("https://pokeapi.co/api/v2/pokemon?offset=0r&limit=15"));
    if (response.statusCode == 200) {
      print("Conexão bem-sucedida!");
    } else {
      print("Erro: ${response.statusCode}");
    }
  } catch (e) {
    print("Exceção: $e");
  }
}

  Future<void> buscarUsuariosCadastrados() async {
    var data = {
      "id": "0",
      "username": "Luana123",
      "password": "jerry@gmail.com",
      "senha": "123",
      "cargo": "vendas"
    };

    try {
      var response = await http.post(
        Uri.parse("https://projeto-sementes.onrender.com/usuarios"),
        // headers: {
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: jsonEncode(data),
      );

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
}
