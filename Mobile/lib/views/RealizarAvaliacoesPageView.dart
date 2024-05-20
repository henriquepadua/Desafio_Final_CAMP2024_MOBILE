import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RealizarAvaliacoesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RealizarAvaliacoesPageViewState();
}

class RealizarAvaliacoesPageViewState
    extends State<RealizarAvaliacoesPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
          // currentIndex: _selectedIndex,
          // selectedItemColor: Colors.amber[800],
          // onTap: _onItemTapped,
        ),
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
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
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
          child: const Text(
            "Karina Camp",
            style: TextStyle(fontSize: 30, color: Color(0xFFF47920)),
          ),
        ),
        const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Area de Design",
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
          ],
        ),
        Container(
          width: 40,
          padding: EdgeInsets.symmetric(horizontal: 40),
          color: Color(0xFF6D0467),
          child: Card(
            child: ListTile(
              title: Text("Nova avaliação",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Color(0xFF6D0467))),
            ),
          ),
        ),
        Container(
          color: Color(0xFF6D0467),
          child: Column(children: [
            Image.asset("assets/Pergunta1.png"),
            Image.asset("assets/Pergunta2.png"),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Image.asset("assets/Avaliacaoscrita.png"),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
                    ),
                    onPressed: () async {
                      
                    },
                    child: const Text(
                      "Enviar Avaliação",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                              Padding(padding: EdgeInsets.symmetric(vertical: 10)),

          ]),
        )
      ]),
    );
  }
}
