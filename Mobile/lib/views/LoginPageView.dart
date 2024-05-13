import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class LoginPageView extends StatefulWidget {
  const LoginPageView({super.key});

  @override
  State<LoginPageView> createState() => _LoginPageViewState();
}

class _LoginPageViewState extends State<LoginPageView> {
  bool _mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Seja bem-vindo ao Sementes!",
                      style:
                        TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                    Text(
                      "Entre ou faça seu cadastro com a conta da empresa",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    )
                  ],
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
                    const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
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
                      obscureText: !_mostrarSenha,
                      decoration: InputDecoration(
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
                        newValue = !newValue!;
                      },
                    ),
                    const Text(
                      "Manter-se conectado",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                    ),
                    // TextButton(
                    //     onPressed: () {},
                    //     child: const Text(
                    //       "Esqueceu sua senha?",
                    //       style: TextStyle(
                    //           fontSize: 12,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black),
                    //     ))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width:
                      300, // Define a largura para preencher toda a largura disponível
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    onPressed: () {},
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
                    width:
                        300, // Define a largura para preencher toda a largura disponível
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: Column(
                                    children: [
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 30)),
                                      const Row(
                                        children: [
                                          Text('E-mail'),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5)),
                                      const TextField(
                                        decoration: InputDecoration(
                                            labelText: "Insira seu email",
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            border: OutlineInputBorder()),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 25)),
                                      const Row(
                                        children: [
                                          Text('Crie sua senha'),
                                        ],
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 5)),
                                      TextField(
                                        obscureText: !_mostrarSenha,
                                        keyboardType:
                                            TextInputType.visiblePassword,
                                        decoration: InputDecoration(
                                            labelText: "Insira sua senha",
                                            labelStyle: const TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
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
                                            border: const OutlineInputBorder()),
                                      ),
                                      const Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 40))
                                    ],
                                  ),
                                  actions: <Widget>[
                                    const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 10)),
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
                                            onPressed: () {
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
