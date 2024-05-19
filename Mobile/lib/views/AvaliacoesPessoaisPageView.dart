import 'package:flutter/material.dart';

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
                        padding: EdgeInsets.symmetric(vertical: 30),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15)),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
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
                            "Relatório",
                            style: TextStyle(
                                color: Color(0xFF6D0467),
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.arrow_downward_outlined,
                            color: Color(0xFF6D0467),
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                      Image.asset("assets/Line18.png"),
                      Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                      Row(
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
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png"),
                        ],
                      ),
                      const Text(
                                "Flexibilidade",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png"),
                        ],
                      ),
                      const Text(
                                "Proatividade",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png"),
                        ],
                      ),
                      const Text(
                                "Comunicação",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                      Row(
                        children: [
                          Image.asset("assets/Frame237.png"),
                        ],
                      ),
                      const Text(
                                "Criatividade",
                                style: TextStyle(
                                    fontSize: 10, color: Colors.white),
                              ),
                      Row(
                        children: [
                          
                          Image.asset("assets/Frame237.png"),
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

// import 'package:flutter/material.dart';

// class AvaliacoesPessoaisView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => AvaliacoesPessoaisViewState();
// }

// class AvaliacoesPessoaisViewState extends State<AvaliacoesPessoaisView> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: const Color.fromRGBO(109, 4, 103, 1),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SingleChildScrollView(
//                 child: Container(
//                   color: Colors.white,
//                   child: Column(
//                     children: [
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 30),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [Image.asset("assets/Ellipse124.png")],
//                       ),
//                       const Text(
//                         "Karina Camp",
//                         style:
//                             TextStyle(fontSize: 30, color: Color(0xFF6D0467)),
//                       ),
//                       const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Text(
//                             "Area de Design",
//                             style: TextStyle(fontSize: 15, color: Colors.black),
//                           ),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5)),
//                           Image.asset("assets/Ellipse59.png"),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5)),
//                           const Text(
//                             "Estagiária",
//                             style: TextStyle(fontSize: 12, color: Colors.black),
//                           ),
//                         ],
//                       ),
//                       const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset("assets/icon_magnifyingglass.png"),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5)),
//                           const Column(
//                             children: [
//                               Text(
//                                 "É semente Há",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 8,
//                                     color: Color(0xFF6D0467)),
//                               ),
//                               Text(
//                                 "1 ANO",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                     color: Color(0xFF6D0467)),
//                               ),
//                             ],
//                           ),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 25)),
//                           Image.asset("assets/Group33730.png"),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5)),
//                           const Column(
//                             children: [
//                               Text(
//                                 "Avaliações",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 8,
//                                     color: Color(0xFF6D0467)),
//                               ),
//                               Text(
//                                 "87",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                     color: Color(0xFF6D0467)),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 5),
//                       ),
//                       Image.asset("assets/Line7.png"),
//                       const Padding(
//                         padding: EdgeInsets.symmetric(vertical: 15),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 15)),
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               child: const Text(
//                                 "Avaliações \n feitas por você",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xFF696F79), fontSize: 16),
//                               ),
//                             ),
//                           ),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 15)),
//                           Expanded(
//                             child: ElevatedButton(
//                               onPressed: () {},
//                               style: ButtonStyle(
//                                 backgroundColor:
//                                     MaterialStateProperty.all<Color>(
//                                         const Color(0xFF43C9E2)),
//                               ),
//                               child: const Text(
//                                 "Carreiras",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Color(0xFFE6E6E6), fontSize: 16),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Stack(
//                             children: [
//                               Image.asset("assets/Ellipse112.png"),
//                               Positioned(
//                                 top: 0,
//                                 left: 0,
//                                 child: Image.asset("assets/Ellipse113.png"),
//                               ),
//                               Positioned(
//                                 top: 50,
//                                 left: 46,
//                                 child: Image.asset("assets/8.9.png"),
//                               ),
//                             ],
//                           ),
//                           const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 10)),
//                           Column(
//                             children: [
//                               const Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               const Text(
//                                 "Comunicação",
//                                 style: TextStyle(
//                                     fontSize: 10, color: Color(0xFF6D0467)),
//                               ),
//                               Image.asset("assets/Group33674.png"),
//                               const Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               const Text(
//                                 "Flexibilidade",
//                                 style: TextStyle(
//                                     fontSize: 10, color: Color(0xFF6D0467)),
//                               ),
//                               Image.asset("assets/Group33674(1).png"),
//                               const Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               const Text(
//                                 "Proatividade",
//                                 style: TextStyle(
//                                     fontSize: 10, color: Color(0xFF6D0467)),
//                               ),
//                               Image.asset("assets/Group33674(2).png"),
//                               const Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               const Text(
//                                 "Criatividade",
//                                 style: TextStyle(
//                                     fontSize: 10, color: Color(0xFF6D0467)),
//                               ),
//                               Image.asset("assets/Group33674(3).png"),
//                               const Padding(
//                                   padding: EdgeInsets.symmetric(vertical: 10)),
//                               const Text(
//                                 "Inteligência Emocional",
//                                 style: TextStyle(
//                                     fontSize: 10, color: Color(0xFF6D0467)),
//                               ),
//                               Image.asset("assets/Group33674(4).png"),
//                             ],
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 22)),
//                           Text(
//                             "Relatório",
//                             style: TextStyle(
//                                 color: Color(0xFF6D0467),
//                                 fontWeight: FontWeight.bold),
//                           ),
//                           Icon(
//                             Icons.arrow_downward_outlined,
//                             color: Color(0xFF6D0467),
//                           )
//                         ],
//                       ),
//                       Padding(padding: EdgeInsets.symmetric(vertical: 5)),
//                       Image.asset("assets/Line18.png"),
//                       Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                         Text("CONTEÚDO",style: TextStyle(fontSize: 16,color: Color(0xFF43C9E2)),)
//                       ],)
//                     ],
//                   ),
//                 ),
//               ),
//               ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   Image.asset("assets/Frame237.png")
//               ],)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
