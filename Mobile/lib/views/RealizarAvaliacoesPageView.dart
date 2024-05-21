import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RealizarAvaliacoesPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RealizarAvaliacoesPageViewState();
}

class RealizarAvaliacoesPageViewState
    extends State<RealizarAvaliacoesPageView> {
  String nome = '';
  String cargo = '';

  // Lista de perguntas com suas opções
  final List<String> _perguntas = [
    "Avaliar Inteligência Emocional",
    "Avaliar Flexibilidade",
    "Avaliar Proatividade",
    "Avaliar Comunicação",
    "Avaliar Criatividade",
    "Avaliar Observação"
  ];

  // Lista de índices dos checkboxes selecionados
  List<int?> _selectedCheckboxIndexes = List.generate(6, (_) => null);

  // Controlador do TextField
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
    });
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
        // Adicionando TextField
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            controller: _textController,
            decoration: InputDecoration(
              labelText: 'Digite seu comentário',
              fillColor: Colors.white,
              filled: true,
            ),
          ),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
          ),
          onPressed: () async {
            // Lógica para enviar a avaliação
            print(
                "Respostas: ${_selectedCheckboxIndexes.map((index) => index != null ? index + 1 : 'Nenhuma').toList()}");
            print("Resposta digitada: ${_textController.text}");
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


// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class RealizarAvaliacoesPageView extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() => RealizarAvaliacoesPageViewState();
// }

// class RealizarAvaliacoesPageViewState
//     extends State<RealizarAvaliacoesPageView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
//             BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
//           ],
//           // currentIndex: _selectedIndex,
//           // selectedItemColor: Colors.amber[800],
//           // onTap: _onItemTapped,
//         ),
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
//           child: const Text(
//             "Karina Camp",
//             style: TextStyle(fontSize: 30, color: Color(0xFFF47920)),
//           ),
//         ),
//         const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "Area de Design",
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
//           child: Column(children: [
//             Image.asset("assets/Pergunta1.png"),
//             Image.asset("assets/Pergunta2.png"),
//             Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//             Image.asset("assets/Avaliacaoscrita.png"),
//             Padding(padding: EdgeInsets.symmetric(vertical: 10)),
//             ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
//                     ),
//                     onPressed: () async {
                      
//                     },
//                     child: const Text(
//                       "Enviar Avaliação",
//                       style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                               Padding(padding: EdgeInsets.symmetric(vertical: 10)),

//           ]),
//         )
//       ]),
//     );
//   }
// }
