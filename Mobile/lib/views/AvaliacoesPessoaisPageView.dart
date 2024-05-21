import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'BuscarPageView.dart';
import 'HomePageView.dart';
import 'PerfilPageView.dart';

class AvaliacoesPessoaisView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AvaliacoesPessoaisViewState();
}

class AvaliacoesPessoaisViewState extends State<AvaliacoesPessoaisView> {
  String _nomeUsuario = '';
  String _cargoUsuario = '';
  String _idUsuario = '';
  List<Map<String, String>> _avaliacoes = [];

  @override
  void initState() {
    super.initState();
    pegarNome();
    carregarAvaliacoes();
  }

  void pegarNome() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String nomeUsuario = prefs.getString('nome') ?? '';
    String cargoUsuario = prefs.getString('cargo') ?? '';
    String idUsuario = prefs.getString('id') ?? '';
    setState(() {
      _nomeUsuario = nomeUsuario;
      _cargoUsuario = cargoUsuario;
      _idUsuario = idUsuario;
    });
  }

  void carregarAvaliacoes() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> avaliacoesJson = prefs.getStringList('avaliacoes') ?? [];
    List<Map<String, String>> avaliacoes =
        avaliacoesJson.map((avl) => Map<String, String>.from(json.decode(avl))).toList();
    setState(() {
      _avaliacoes = avaliacoes;
    });
  }

  int _selectedIndex = 1;
  final PageController _pageController = PageController(initialPage: 1);

  static final List<Widget> _pages = <Widget>[
    BuscarPageView(),
    PerfilPageView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(109, 4, 103, 1),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      const Center(
                        child: CircleAvatar(
                          maxRadius: 50,
                          minRadius: 10,
                          child: Icon(Icons.person_2, size: 50),
                        ),
                      ),
                      Text(
                        _nomeUsuario,
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFF6D0467)),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _cargoUsuario,
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icon_magnifyingglass.png"),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5)),
                          const Column(
                            children: [
                              Text(
                                "É semente Há",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Color(0xFF6D0467)),
                              ),
                              Text(
                                "1 ANO",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF6D0467)),
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25)),
                          Image.asset("assets/Group33730.png"),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5)),
                          Column(
                            children: [
                              Text(
                                "Avaliações",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 8,
                                    color: Color(0xFF6D0467)),
                              ),
                              Text(
                                "${_avaliacoes.length}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF6D0467)),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                      ),
                      Image.asset("assets/Line7.png"),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15)),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => HomePageView()));
                              },
                              child: const Text(
                                "Avaliações \n feitas por você",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF696F79), fontSize: 16),
                              ),
                            ),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15)),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        const Color(0xFF43C9E2)),
                              ),
                              child: const Text(
                                "Carreiras",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFFE6E6E6), fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Image.asset("assets/Ellipse112.png"),
                              Positioned(
                                top: 0,
                                left: 0,
                                child: Image.asset("assets/Ellipse113.png"),
                              ),
                              Positioned(
                                top: 50,
                                left: 46,
                                child: Image.asset("assets/8.9.png"),
                              ),
                            ],
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              const Text(
                                "Comunicação",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF6D0467)),
                              ),
                              Image.asset("assets/Group33674.png"),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              const Text(
                                "Flexibilidade",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF6D0467)),
                              ),
                              Image.asset("assets/Group33674(1).png"),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              const Text(
                                "Proatividade",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF6D0467)),
                              ),
                              Image.asset("assets/Group33674(2).png"),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              const Text(
                                "Criatividade",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF6D0467)),
                              ),
                              Image.asset("assets/Group33674(3).png"),
                              const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10)),
                              const Text(
                                "Inteligência Emocional",
                                style: TextStyle(
                                    fontSize: 10, color: Color(0xFF6D0467)),
                              ),
                              Image.asset("assets/Group33674(4).png"),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 22)),
                          Text(
                                "Feedback",
                                style: TextStyle(
                                    color: Color(0xFF6D0467),
                                    fontWeight: FontWeight.bold,fontSize: 20),
                              ),
                        ],
                      ),
                      const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5)),
                      ExpansionTile(
                        title: Row(
                          children: [
                            const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15)),
                            const Text(
                              "Relatório",
                              style: TextStyle(
                                color: Color(0xFF6D0467),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        children: <Widget>[
                          Image.asset("assets/Feedback.png"),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Image.asset("assets/Line18.png"),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "CONTEÚDO",
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF43C9E2)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      const Text(
                        "Inteligência Emocional",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png", height: 50, width: 500),
                        ],
                      ),
                      const Text(
                        "Flexibilidade",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png", height: 50, width: 500),
                        ],
                      ),
                      const Text(
                        "Proatividade",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png", height: 50, width: 500),
                        ],
                      ),
                      const Text(
                        "Comunicação",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png", height: 50, width: 500),
                        ],
                      ),
                      const Text(
                        "Criatividade",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png", height: 50, width: 500),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}