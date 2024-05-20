import 'package:Mobile/views/Avalia%C3%A7%C3%B5esRealizadasPageView.dart';
import 'package:Mobile/views/AvaliacoesPessoaisPageView.dart';
import 'package:Mobile/views/HomePageView.dart';
import 'package:flutter/material.dart';

class PerfilPageView extends StatefulWidget {
  @override
  _PerfilPageViewState createState() => _PerfilPageViewState();
}

class _PerfilPageViewState extends State<PerfilPageView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
          const Text(
            "Karina Camp",
            style: TextStyle(fontSize: 30, color: Color(0xFF6D0467)),
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
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromRGBO(109, 4, 103, 1)),
                  ),
                  child: const Text(
                    "Avaliações \n feitas por você",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AvaliacoesPessoaisView()));
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    "Carreiras",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical:10)),
          Container(
            color: Color(0xFFF47920),
            width: 350,
            height: 120,
            child: Builder(builder: (context) {
              return Card(
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => AvaliacoesRealizadasPageView()),
                        );
                      },
                      leading: Image.asset("assets/ImageAvatar.png"),
                      title: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                          ),
                          Text(
                            'Lucas Santos',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20)),
                          Text(
                            'Peoduct Design',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 63),
                        ),
                        const Icon(Icons.timer_sharp),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Text(
                            'Feita há 3 meses',
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
          // Adicione os outros cards da mesma maneira
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomePageView()),
              );
            },
            child: const Text(
              "Carregar mais projetos",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Row(children: [
          //   Text("data")
          // ],)
        ],
      ),
    );
  }
}
