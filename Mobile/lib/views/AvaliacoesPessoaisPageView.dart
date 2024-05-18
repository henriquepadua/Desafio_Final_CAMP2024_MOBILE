import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvaliacoesPessoaisView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AvaliacoesPessoaisViewState();
}

class AvaliacoesPessoaisViewState extends State<AvaliacoesPessoaisView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromRGBO(109, 4, 103, 1),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Align items at the start vertically
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment
                            .center, // Align items at the start vertically
                        children: [Image.asset("assets/Ellipse124.png")],
                      ),
                      const Text(
                        "Karina Camp",
                        style:
                            TextStyle(fontSize: 30, color: Color(0xFF6D0467)),
                      ),
                      const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Area de Design",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          ),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5)),
                          Image.asset("assets/Ellipse59.png"),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5)),
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
                                "87",
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
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15)),
                          ElevatedButton(
                              onPressed: () {},
                              child: const Text(
                                "Avaliações \n feitas por você",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xFF696F79), fontSize: 16),
                              )),
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15)),
                          ElevatedButton(
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
                              )),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              Image.asset("assets/Ellipse112.png"),
                              Positioned(
                                top: 0, // Ajuste conforme necessário
                                left: 0, // Ajuste conforme necessário
                                child: Image.asset("assets/Ellipse113.png"),
                              ),
                              Positioned(
                                top: 50, // Ajuste conforme necessário
                                left: 46, // Ajuste conforme necessário
                                child: Image.asset("assets/8.9.png"),
                              ),
                            ],
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                          Column(children: [
                            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                            Text("Comunicação",style: TextStyle(fontSize: 10,color: Color(0xFF6D0467)),),
                            Image.asset("assets/Group33674.png"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                            Text("Flexibilidade",style: TextStyle(fontSize: 10,color: Color(0xFF6D0467)),),
                            Image.asset("assets/Group33674(1).png"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                            Text("Proatividade",style: TextStyle(fontSize: 10,color: Color(0xFF6D0467)),),
                            Image.asset("assets/Group33674(2).png"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                            Text("Criatividade",style: TextStyle(fontSize: 10,color: Color(0xFF6D0467)),),
                            Image.asset("assets/Group33674(3).png"),
                            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                            Text("Inteligência Emocional",style: TextStyle(fontSize: 10,color: Color(0xFF6D0467)),),
                            Image.asset("assets/Group33674(4).png"),
                          ],),  
                        ],
                      ),
                      // Row(children: [
                      //       ExpansionTile(title: Text("Relatório"))
                      //     ],)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
