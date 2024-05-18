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
      body: Column(
        children: [
          const Padding(
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
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 28)),
              Text("Buscas recentes",
                  style: TextStyle(
                    fontSize: 13,
                    //fontWeight:  15.21,
                    //fontFamily:  FontFamily(Font(R.font.rubik)),
                    //fontWeight:  FontWeight(400),
                    color: Color(0xFF858494),
                    //textAlign: TextAlign.Center,
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 28)),
              Text("Integrantes",
                  style: TextStyle(
                    fontSize: 13,
                    //fontWeight:  15.21,
                    //fontFamily:  FontFamily(Font(R.font.rubik)),
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF858494),
                    //textAlign: TextAlign.Center,
                  )),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
              Image.asset(height: 50, width: 50, "assets/ImageAvatar.png"),
              Padding(padding: EdgeInsets.symmetric(horizontal: 17)),
              Image.asset("assets/Ellipse106.png"),
              Padding(padding: EdgeInsets.symmetric(horizontal: 17)),
              Image.asset("assets/Ellipse107.png"),
              Padding(padding: EdgeInsets.symmetric(horizontal: 17)),
              Image.asset("assets/Ellipse108.png"),
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Row(
            children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Text("Lucas Santos",style: TextStyle(fontSize: 13)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
              Text("Sofia Mendez",style: TextStyle(fontSize: 13),),
              Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
              Text("Beatriz Costa",style: TextStyle(fontSize: 13)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
              Text("Pedro Oliveira",style: TextStyle(fontSize: 13)),
            ],
          ),
        ],
      ),
    ));
  }
}