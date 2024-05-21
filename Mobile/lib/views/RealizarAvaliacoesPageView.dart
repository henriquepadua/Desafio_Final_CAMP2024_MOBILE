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
    "Como você avalia a sua experiência com o nosso produto?",
    "Quão satisfeito você está com o atendimento ao cliente?",
    "Você recomendaria nosso produto para outras pessoas?",
    "O que você mais gosta no nosso produto?",
    "Como podemos melhorar nosso produto?"
  ];

  // Índice da pergunta selecionada
  int? _selectedQuestionIndex;

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
        title: Text('Realizar Avaliações'),
      ),
      body: ListView(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
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
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF43C9E2)),
            ),
            onPressed: () async {
              // Lógica para enviar a avaliação
              print("Pergunta selecionada: ${_selectedQuestionIndex != null ? _perguntas[_selectedQuestionIndex!] : 'Nenhuma'}");
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
        ],
      ),
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
              Text(
                _perguntas[i],
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              Row(
                children: List.generate(5, (index) {
                  final value = index + 1;
                  return Checkbox(
                    value: _selectedQuestionIndex == i && _selectedQuestionIndex == index,
                    onChanged: (bool? isChecked) {
                      setState(() {
                        _selectedQuestionIndex = isChecked! ? i : null;
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
