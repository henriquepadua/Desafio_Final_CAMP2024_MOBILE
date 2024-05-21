import 'dart:convert';
import 'package:Mobile/views/Avalia%C3%A7%C3%B5esRealizadasPageView.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'AvaliacoesPessoaisPageView.dart';
import 'HomePageView.dart';

class PerfilPageView extends StatefulWidget {
  @override
  _PerfilPageViewState createState() => _PerfilPageViewState();
}

class _PerfilPageViewState extends State<PerfilPageView> {
  TextEditingController nome = TextEditingController();
  String _nomeUsuario = '';
  String _cargoUsuario = '';
  String _idUsuario = '';
  List<Map<String, String>> _avaliacoes = [];
  int _numAvaliacoes = 0;

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
    List<Map<String, String>> avaliacoes = avaliacoesJson
        .map((avl) => Map<String, String>.from(json.decode(avl)))
        .toList();

    setState(() {
      _avaliacoes = avaliacoes;
      _numAvaliacoes = avaliacoes.length;
    });

    await prefs.setInt('numAvaliacoes', _numAvaliacoes);
  }

  Future<void> chamarApiFeedback() async {
    final url =
        'https://projeto-sementes.onrender.com/feedbacks/user/$_idUsuario';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Salvar o response.body no SharedPreferences
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('feedbacks', response.body);
        print('Success: ${response.body}');
      } else {
        print('Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
          Text(
            _nomeUsuario,
            style: TextStyle(fontSize: 30, color: Color(0xFF6D0467)),
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
              Column(
                children: [
                  const Text(
                    "Avaliações",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        color: Color(0xFF6D0467)),
                  ),
                  Text(
                    "$_numAvaliacoes",
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
                  onPressed: () async {
                    await chamarApiFeedback();
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
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          ..._avaliacoes.map((avaliacao) => Container(
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
                                  builder: (context) =>
                                      AvaliacoesRealizadasPageView()),
                            );
                          },
                          leading: Image.asset("assets/ImageAvatar.png"),
                          title: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                              ),
                              Text(
                                avaliacao['nome'] ?? '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20)),
                              Text(
                                avaliacao['cargo'] ?? '',
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              )),
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


// import 'dart:convert';
// import 'package:Mobile/services/DatabaseService.dart';
// import 'package:Mobile/views/Avalia%C3%A7%C3%B5esRealizadasPageView.dart';
// import 'package:Mobile/views/AvaliacoesPessoaisPageView.dart';
// import 'package:Mobile/views/HomePageView.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class PerfilPageView extends StatefulWidget {
//   @override
//   _PerfilPageViewState createState() => _PerfilPageViewState();
// }

// class _PerfilPageViewState extends State<PerfilPageView> {
//   TextEditingController nome = TextEditingController();
//   String _nomeUsuario = '';
//   String _cargoUsuario = '';
//   String _nomeAvaliado = '';
//   String _cargoAvaliado = '';
//   String _idUsuario = '';
//   List<Map<String, String>> _avaliacoes = [];
//   int _numAvaliacoes = 0;

//   @override
//   void initState() {
//     super.initState();
//     pegarNome();
//     carregarAvaliacoes();
//   }

//   void pegarNome() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String nomeUsuario = prefs.getString('nome') ?? '';
//     String cargoUsuario = prefs.getString('cargo') ?? '';
//     String idUsuario = prefs.getString('id') ?? '';
//     setState(() {
//       _nomeUsuario = nomeUsuario;
//       _cargoUsuario = cargoUsuario;
//       _idUsuario = idUsuario;
//     });
//   }

//   void carregarAvaliacoes() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> avaliacoesJson = prefs.getStringList('avaliacoes') ?? [];
//     List<Map<String, String>> avaliacoes = 
//         avaliacoesJson.map((avl) => Map<String, String>.from(json.decode(avl))).toList();

//     setState(() {
//       _avaliacoes = avaliacoes;
//       _numAvaliacoes = avaliacoes.length;
//     });

//     await prefs.setInt('numAvaliacoes', _numAvaliacoes);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//           ),
//           const Center(
//             child: CircleAvatar(
//               maxRadius: 50,
//               minRadius: 10,
//               child: Icon(Icons.person_2, size: 50),
//             ),
//           ),
//           Text(
//             _nomeUsuario,
//             style: TextStyle(fontSize: 30, color: Color(0xFF6D0467)),
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 _cargoUsuario,
//                 style: TextStyle(fontSize: 12, color: Colors.black),
//               ),
//             ],
//           ),
//           const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Image.asset("assets/icon_magnifyingglass.png"),
//               const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
//               const Column(
//                 children: [
//                   Text(
//                     "É semente Há",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 8,
//                         color: Color(0xFF6D0467)),
//                   ),
//                   Text(
//                     "1 ANO",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Color(0xFF6D0467)),
//                   ),
//                 ],
//               ),
//               const Padding(padding: EdgeInsets.symmetric(horizontal: 25)),
//               Image.asset("assets/Group33730.png"),
//               const Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
//               Column(
//                 children: [
//                   const Text(
//                     "Avaliações",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 8,
//                         color: Color(0xFF6D0467)),
//                   ),
//                   Text(
//                     "$_numAvaliacoes",
//                     style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                         color: Color(0xFF6D0467)),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 5),
//           ),
//           Image.asset("assets/Line7.png"),
//           const Padding(
//             padding: EdgeInsets.symmetric(vertical: 15),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(
//                         Color.fromRGBO(109, 4, 103, 1)),
//                   ),
//                   child: const Text(
//                     "Avaliações \n feitas por você",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//               const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: () {

//                     Navigator.of(context).push(MaterialPageRoute(
//                         builder: (context) => AvaliacoesPessoaisView()));
//                   },
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
//                   ),
//                   child: const Text(
//                     "Carreiras",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.black, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//           ..._avaliacoes.map((avaliacao) => Container(
//                 color: Color(0xFFF47920),
//                 width: 350,
//                 height: 120,
//                 child: Builder(builder: (context) {
//                   return Card(
//                     clipBehavior: Clip.antiAlias,
//                     child: Column(
//                       children: [
//                         ListTile(
//                           onTap: () {
//                             Navigator.of(context).push(
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       AvaliacoesRealizadasPageView()),
//                             );
//                           },
//                           leading: Image.asset("assets/ImageAvatar.png"),
//                           title: Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                               ),
//                               Text(
//                                 avaliacao['nome'] ?? '',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           subtitle: Row(
//                             children: [
//                               Padding(
//                                   padding: EdgeInsets.symmetric(horizontal: 20)),
//                               Text(
//                                 avaliacao['cargo'] ?? '',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 }),
//               )),
//           ElevatedButton(
//             style: ButtonStyle(
//               backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
//             ),
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(builder: (context) => const HomePageView()),
//               );
//             },
//             child: const Text(
//               "Carregar mais projetos",
//               style: TextStyle(
//                 fontSize: 17,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
