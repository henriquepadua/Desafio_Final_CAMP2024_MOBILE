import 'package:Mobile/views/LoginPageView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'RealizarAvaliacoesPageView.dart';

class AvaliacoesRealizadasPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AvaliacoesRealizadasPageViewState();
}

class AvaliacoesRealizadasPageViewState
    extends State<AvaliacoesRealizadasPageView> {
  String nome = '';
  String cargo = '';

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      nome = prefs.getString('nomePesquisado') ?? 'Nome não encontrado';
      cargo = prefs.getString('cargoPesquisado') ?? 'Cargo não encontrado';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color.fromRGBO(109, 4, 103, 1),
        actions: [
          IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => const LoginPageView()),
                        );
              },
            ),
        ],
      ),
      body: ListView(
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
          Center(
            child: Text(
              nome,
              style: TextStyle(fontSize: 30, color: Color(0xFFF47920)),
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                cargo,
                style: TextStyle(fontSize: 12, color: Colors.black),
              ),
            ],
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/icon_magnifyingglass.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
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
              const Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
              Image.asset("assets/Group33730.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              const Column(
                children: [
                  Text(
                    "Avaliações",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        color: Color(0xFF6D0467)),
                  ),
                  Text(
                    "0",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF6D0467)),
                  ),
                ],
              ),
            ],
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RealizarAvaliacoesPageView()));
                    },
                    icon: Image.asset("assets/Group33735.png"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}