import 'package:Mobile/views/HomePageView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RealizarAvaliacoesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RealizarAvaliacoesPageViewState();
}

class RealizarAvaliacoesPageViewState
    extends State<RealizarAvaliacoesPageView> {
  String nome = '';
  String cargo = '';
  String usuarioAvaliadoId = '';

  final List<String> _perguntas = [
    "Avaliar Inteligência Emocional",
    "Avaliar Flexibilidade",
    "Avaliar Proatividade",
    "Avaliar Comunicação",
    "Avaliar Criatividade",
    "Avaliar Observação"
  ];

  List<int?> _selectedCheckboxIndexes = List.generate(6, (_) => null);

  final TextEditingController _textController = TextEditingController();

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
      usuarioAvaliadoId =
          prefs.getString('idPesquisado') ?? 'Id não encontrado';
    });
  }

  Future<void> _sendAvaliacao() async {
    final prefs = await SharedPreferences.getInstance();
    final avaliacoesJson = prefs.getStringList('avaliacoes') ?? [];
    final novaAvaliacao = {
      'nome': nome,
      'cargo': cargo,
    };

    avaliacoesJson.add(json.encode(novaAvaliacao));

    await prefs.setStringList('avaliacoes', avaliacoesJson);

    final url =
        Uri.parse('https://projeto-sementes.onrender.com/avaliacoes/criar');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({
      'usuarioAvaliadoId': usuarioAvaliadoId,
      'comunicacao': _selectedCheckboxIndexes[3] != null
          ? _selectedCheckboxIndexes[3]! + 1
          : 0,
      'proatividade': _selectedCheckboxIndexes[2] != null
          ? _selectedCheckboxIndexes[2]! + 1
          : 0,
      'inteligenciaEmocional': _selectedCheckboxIndexes[0] != null
          ? _selectedCheckboxIndexes[0]! + 1
          : 0,
      'flexibilidade': _selectedCheckboxIndexes[1] != null
          ? _selectedCheckboxIndexes[1]! + 1
          : 0,
      'criatividade': _selectedCheckboxIndexes[4] != null
          ? _selectedCheckboxIndexes[4]! + 1
          : 0,
      'observacao': _selectedCheckboxIndexes[5] != null
          ? _selectedCheckboxIndexes[5]! + 1
          : 0,
      'comentario': _textController.text,
    });

    try {
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 201) {
        print('Avaliação enviada com sucesso');
      } else {
        print('Erro ao enviar avaliação: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao enviar avaliação: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
        ],
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
          child: Column(
            children: _buildPerguntas(),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(vertical: 10)),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
                labelText: 'Digite sua Observação',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder()),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
          ),
          onPressed: () async {
            await _sendAvaliacao();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePageView()),
            );
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
    );
  }

  List<Widget> _buildPerguntas() {
    List<Widget> widgets = [];
    for (int i = 0; i < _perguntas.length; i++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  _perguntas[i],
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return Checkbox(
                    value: _selectedCheckboxIndexes[i] == index,
                    onChanged: (bool? isChecked) {
                      setState(() {
                        if (isChecked != null && isChecked) {
                          _selectedCheckboxIndexes[i] = index;
                        } else {
                          _selectedCheckboxIndexes[i] = null;
                        }
                      });
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      );
    }
    return widgets;
  }
}


// import 'package:Mobile/views/HomePageView.dart';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class RealizarAvaliacoesPageView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => RealizarAvaliacoesPageViewState();
// }

// class RealizarAvaliacoesPageViewState
//     extends State<RealizarAvaliacoesPageView> {
//   String nome = '';
//   String cargo = '';
//   String usuarioAvaliadoId = '';

//   final List<String> _perguntas = [
//     "Avaliar Inteligência Emocional",
//     "Avaliar Flexibilidade",
//     "Avaliar Proatividade",
//     "Avaliar Comunicação",
//     "Avaliar Criatividade",
//     "Avaliar Observação"
//   ];

//   List<int?> _selectedCheckboxIndexes = List.generate(6, (_) => null);

//   final TextEditingController _textController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     setState(() {
//       nome = prefs.getString('nomePesquisado') ?? 'Nome não encontrado';
//       cargo = prefs.getString('cargoPesquisado') ?? 'Cargo não encontrado';
//       usuarioAvaliadoId =
//           prefs.getString('idPesquisado') ?? 'Id não encontrado';
//     });
//   }

//   Future<void> _sendAvaliacao() async {
//     final url =
//         Uri.parse('https://projeto-sementes.onrender.com/avaliacoes/criar');
//     final headers = {'Content-Type': 'application/json'};
//     final body = json.encode({
//       'usuarioAvaliadoId': usuarioAvaliadoId,
//       'comunicacao': _selectedCheckboxIndexes[3] != null
//           ? _selectedCheckboxIndexes[3]! + 1
//           : 0,
//       'proatividade': _selectedCheckboxIndexes[2] != null
//           ? _selectedCheckboxIndexes[2]! + 1
//           : 0,
//       'inteligenciaEmocional': _selectedCheckboxIndexes[0] != null
//           ? _selectedCheckboxIndexes[0]! + 1
//           : 0,
//       'flexibilidade': _selectedCheckboxIndexes[1] != null
//           ? _selectedCheckboxIndexes[1]! + 1
//           : 0,
//       'criatividade': _selectedCheckboxIndexes[4] != null
//           ? _selectedCheckboxIndexes[4]! + 1
//           : 0,
//       'observacao': _selectedCheckboxIndexes[5] != null
//           ? _selectedCheckboxIndexes[5]! + 1
//           : 0,
//       'comentario': _textController.text,
//     });

//     try {
//       final response = await http.post(url, headers: headers, body: body);

//       if (response.statusCode == 201) {
//         print('Avaliação enviada com sucesso');
//       } else {
//         print('Erro ao enviar avaliação: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Erro ao enviar avaliação: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
//         ],
//       ),
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//         backgroundColor: Color.fromRGBO(109, 4, 103, 1),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: ListView(children: [
//         const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//         ),
//         const Center(
//           child: CircleAvatar(
//             maxRadius: 50,
//             minRadius: 10,
//             child: Icon(Icons.person_2, size: 50),
//           ),
//         ),
//         Center(
//           child: Text(
//             nome,
//             style: TextStyle(fontSize: 30, color: Color(0xFFF47920)),
//           ),
//         ),
//         const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               cargo,
//               style: TextStyle(fontSize: 15, color: Colors.black),
//             ),
//           ],
//         ),
//         Container(
//           width: 40,
//           padding: EdgeInsets.symmetric(horizontal: 40),
//           color: Color(0xFF6D0467),
//           child: Card(
//             child: ListTile(
//               title: Text("Nova avaliação",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(fontSize: 16, color: Color(0xFF6D0467))),
//             ),
//           ),
//         ),
//         Container(
//           color: Color(0xFF6D0467),
//           child: Column(
//             children: _buildPerguntas(),
//           ),
//         ),
//         Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//         Padding(
//           padding: EdgeInsets.all(8.0),
//           child: TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//                 labelText: 'Digite sua Observação',
//                 fillColor: Colors.white,
//                 filled: true,
//                 border: OutlineInputBorder()),
//           ),
//         ),
//         ElevatedButton(
//           style: ButtonStyle(
//             backgroundColor:
//                 MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
//           ),
//           onPressed: () async{
//              _sendAvaliacao();
//               Navigator.of(context).push(
//                           MaterialPageRoute(
//                               builder: (context) => const HomePageView()),
//               );
//           },
//           child: const Text(
//             "Enviar Avaliação",
//             style: TextStyle(
//               fontSize: 17,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//         ),
//         Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//       ]),
//     );
//   }

//   List<Widget> _buildPerguntas() {
//     List<Widget> widgets = [];
//     for (int i = 0; i < _perguntas.length; i++) {
//       widgets.add(
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   _perguntas[i],
//                   style: TextStyle(fontSize: 16, color: Colors.white),
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: List.generate(5, (index) {
//                   return Checkbox(
//                     value: _selectedCheckboxIndexes[i] == index,
//                     onChanged: (bool? isChecked) {
//                       setState(() {
//                         if (isChecked != null && isChecked) {
//                           _selectedCheckboxIndexes[i] = index;
//                         } else {
//                           _selectedCheckboxIndexes[i] = null;
//                         }
//                       });
//                     },
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//       );
//     }
//     return widgets;
//   }
// }
