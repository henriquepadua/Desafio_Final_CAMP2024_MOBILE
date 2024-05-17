import 'package:flutter/material.dart';

class BuscarPageView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BuscarPageViewState();
}

class BuscarPageViewState extends State<BuscarPageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: const SingleChildScrollView(
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 20, 0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
                hintText: "Buscar pokemon",
                labelText: "Buscar integrante ou projeto",
                labelStyle: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                border: OutlineInputBorder(
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
