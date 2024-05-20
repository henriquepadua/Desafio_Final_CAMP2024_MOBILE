import 'dart:ffi';

import 'package:Mobile/controllers/CadastroController.dart';
import 'package:Mobile/controllers/LoginController.dart';
import 'package:Mobile/views/HomePageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  TextEditingController senhaLoginController = TextEditingController();
  TextEditingController emailLoginController = TextEditingController();
  TextEditingController senhaCadastroController = TextEditingController();
  TextEditingController emailCadastroController = TextEditingController();
  TextEditingController nomeCadastroController = TextEditingController();
  TextEditingController cargoCadastroController = TextEditingController();
  String token = "";

  bool _mostrarSenha = false;

  @override
  void initState() {
    super.initState();
    // _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emailLoginController.text = prefs.getString('nome') ?? '';
    senhaLoginController.text = prefs.getString('id') ?? '';
    nomeCadastroController.text = prefs.getString('cargo') ?? '';
  }

  Future<void> _saveData(String nome, String id, String cargo) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('nome', nome);
    await prefs.setString('id', id);
    await prefs.setString('cargo', cargo);

    Future<void> _saveToken() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);
    }
  }
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  color: const Color(0xFF6D0467),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 80),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/Logo.png"),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15)),
                        const Text(
                          "Entre ou faça seu cadastro com a conta da empresa",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 40),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            "Email:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      TextField(
                        controller: emailLoginController,
                        decoration: const InputDecoration(
                            hintText: "Insira o email aqui",
                            hintStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder()),
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10)),
                      const Row(
                        children: [
                          Text(
                            "Senha:",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      TextField(
                        controller: senhaLoginController,
                        obscureText: !_mostrarSenha,
                        decoration: InputDecoration(
                          hintText: "Insira sua senha",
                          hintStyle: const TextStyle(color: Colors.black),
                          border: const OutlineInputBorder(),
                          suffixIcon: TextButton(
                            child: Text(
                              _mostrarSenha ? "Ocultar" : "Mostrar",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              setState(() {
                                _mostrarSenha = !_mostrarSenha;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: Colors.black,
                        checkColor: Colors.white,
                        value: true,
                        onChanged: (bool? newValue) {
                          setState(() {
                            // Altere este valor conforme necessário
                          });
                        },
                      ),
                      const Text(
                        "Manter-se conectado",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                    width: 300,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            const Color(0xFF6D0467)),
                      ),
                      onPressed: () async {
//await _saveData();
                        dynamic resultado = await LoginController()
                            .fazerLoginUsuario(senhaLoginController.value.text,
                                emailLoginController.value.text);
                        print(resultado['name']);
                        print(resultado['id']);
                        print(resultado['cargo']);
                        await _saveData(resultado['name'], resultado['id'],
                            resultado['cargo']);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomePageView()),
                        );
                        // } else {
                        //   ScaffoldMessenger.of(context).showSnackBar(
                        //     const SnackBar(
                        //       content: Text('Usuario não cadastrado'),
                        //     ),
                        //   );
                        // }
                      },
                      child: const Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("Ou")],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF43C9E2)),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    contentPadding: const EdgeInsets.all(8.0),
                                    content: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 20)),
                                          const Row(
                                            children: [
                                              Text('Insira seu Nome Completo'),
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5)),
                                          TextField(
                                            controller: nomeCadastroController,
                                            decoration: const InputDecoration(
                                                labelText: "Nome Completo",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                border: OutlineInputBorder()),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5)),
                                          const Row(
                                            children: [
                                              Text('Insira seu cargo'),
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5)),
                                          TextField(
                                            controller: cargoCadastroController,
                                            decoration: const InputDecoration(
                                                labelText: "Insira seu cargo",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                border: OutlineInputBorder()),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5)),
                                          const Row(
                                            children: [
                                              Text('Insira seu email'),
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5)),
                                          TextField(
                                            controller: emailCadastroController,
                                            decoration: const InputDecoration(
                                                labelText: "Insira seu email",
                                                labelStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                border: OutlineInputBorder()),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10)),
                                          const Row(
                                            children: [
                                              Text('Insira sua senha'),
                                            ],
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5)),
                                          TextField(
                                            controller: senhaCadastroController,
                                            obscureText: !_mostrarSenha,
                                            keyboardType:
                                                TextInputType.visiblePassword,
                                            decoration: InputDecoration(
                                                labelText: "Insira sua senha",
                                                labelStyle: const TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                suffixIcon: TextButton(
                                                  child: Text(
                                                    _mostrarSenha
                                                        ? "Ocultar"
                                                        : "Mostrar",
                                                    style: const TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  onPressed: () {
                                                    setState(() {
                                                      _mostrarSenha =
                                                          !_mostrarSenha;
                                                    });
                                                  },
                                                ),
                                                border:
                                                    const OutlineInputBorder()),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 10)),
                                          Image.asset("assets/Line18.png")
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10)),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 250,
                                            child: ElevatedButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                        Color>(Colors.black),
                                              ),
                                              onPressed: () async {
                                                //await _saveData();
                                                await CadastroController()
                                                    .fazerCadastroUsuario(
                                                        senhaCadastroController
                                                            .text,
                                                        emailCadastroController
                                                            .text,
                                                        nomeCadastroController
                                                            .text,
                                                        cargoCadastroController
                                                            .text);
                                                Navigator.of(context)
                                                    .pop(); // Fecha o diálogo
                                              },
                                              child: const Text(
                                                'Criar conta',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          );
                        },
                        child: const Text(
                          "Cadastro com conta da empresa",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    }
  }