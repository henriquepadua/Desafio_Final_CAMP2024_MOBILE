import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BuscarPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BuscarPageViewState();
}

class BuscarPageViewState extends State<BuscarPageView> {
  TextEditingController _searchController = TextEditingController();
  List<dynamic> _usuarios = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  if (value.isEmpty) {
                    setState(() {
                      _usuarios.clear();
                    });
                  } else {
                    _buscarUsuarios(value);
                  }
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Colors.black,
                  hintText: "Buscar pokemon",
                  labelText: "Buscar integrante ou projeto",
                  labelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            if (_usuarios.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.symmetric(horizontal: 28)),
                  Text(
                    "Integrantes",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF858494),
                    ),
                  ),
                ],
              ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _buildUsuariosCards(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildUsuariosCards() {
    List<Widget> cards = [];
    for (var usuario in _usuarios) {
      cards.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7),
          child: Column(
            children: [
              CircleAvatar(
                radius: 25,
                child: Icon(Icons.person),
              ),
              SizedBox(height: 5),
              Text(
                usuario['nome'],
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
      );
    }
    return cards;
  }

  Future<void> _buscarUsuarios(String searchTerm) async {
    Uri url = Uri.parse('https://projeto-sementes.onrender.com/usuarios');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> usuarios = jsonDecode(response.body);
        setState(() {
          _usuarios = usuarios
              .where((usuario) =>
                  usuario['nome'].toLowerCase().contains(searchTerm.toLowerCase()))
              .toList();
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
