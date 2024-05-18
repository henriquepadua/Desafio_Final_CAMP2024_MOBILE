import 'package:Mobile/views/AvaliacoesPessoaisPageView.dart';
import 'package:Mobile/views/HomePageView.dart';
import 'package:flutter/material.dart';

class PerfilPageView extends StatelessWidget {
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
          const Center(
            child: Text(
              "Karina Camp",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Area de Design * ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Estagiária",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Image.asset("assets/Caledarioplanta.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              const Text(
                "É SEMENTE HÁ \n 1 ANO",
                style: TextStyle(fontSize: 15),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
              Image.asset("assets/Icon.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              const Text(
                textAlign: TextAlign.center,
                "Avaliações \n 87",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Avaliações feitas por você",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Carreiras",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 350,
            height: 120,
            child: Builder(
              builder: (context) {
                return Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                            builder: (context) => AvaliacoesPessoaisView()),
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
                              padding: EdgeInsets.symmetric(horizontal: 63),),
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
              }
            ),
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
        ],
      ),
    );
  }
}