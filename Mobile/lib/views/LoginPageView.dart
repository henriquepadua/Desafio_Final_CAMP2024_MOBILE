import 'package:Mobile/controllers/LoginController.dart';
import 'package:Mobile/views/HomePageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

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

  bool _mostrarSenha = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Color(0xFF6D0467),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 80),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/Logo.png"),
                      Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                      Text(
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
                      controller: senhaLoginController,
                      obscureText: !_mostrarSenha,
                      decoration: InputDecoration(
                        hintText: "Insira sua senha",
                        hintStyle: TextStyle(color: Colors.black),
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
                          MaterialStateProperty.all<Color>(Color(0xFF6D0467)),
                    ),
                    onPressed: () async {
                      //LoginController().buscarUsuariosCadastrados();
                      if (await LoginController().fazerLoginUsuario()) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const HomePageView()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Usuario não cadastrado'),
                          ),
                        );
                      }
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
                    width:
                        300, // Define a largura para preencher toda a largura disponível
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return AlertDialog(
                                  title: SingleChildScrollView(
                                    child: Column(
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
                                                  fontWeight: FontWeight.bold),
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
                                                  fontWeight: FontWeight.bold),
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
                                                  fontWeight: FontWeight.bold),
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
                                        SingleChildScrollView(
                                          child: TextField(
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
