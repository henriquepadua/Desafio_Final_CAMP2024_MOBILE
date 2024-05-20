import 'package:Mobile/views/RealizarAvaliacoesPageView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvaliacoesRealizadasPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AvaliacoesRealizadasPageViewState();
}

class AvaliacoesRealizadasPageViewState
    extends State<AvaliacoesRealizadasPageView> {
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
          const Center(
            child: Text(
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
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              Image.asset("assets/Ellipse59.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
              const Text(
                "Estagiária",
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
                ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => AvaliacoesRealizadasPageView()),
                    );
                  },
                  //leading: Image.asset("assets/ImageAvatar.png"),
                  title: Container(
                    color: Color(0xFFF47920),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 55),
                        ),
                        Text(
                          'Última avaliação',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 69)),
                      Text(
                        '21/05/2024',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ],
                  ),
                ),
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
