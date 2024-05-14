import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                ),
                Center(
                  child: CircleAvatar(
                    maxRadius: 50,
                    minRadius: 10,
                    child: Icon(Icons.person_2, size: 50),
                  ),
                ),
                Center(
                  child: Text(
                    "Karina Camp",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Area de Design * ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Estagiária",
                      style: TextStyle(fontSize: 30),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Image.asset("assets/Caledarioplanta.png"),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
                    Text(
                      "É SEMENTE HÁ \n 1 ANO",
                      style: TextStyle(fontSize: 15),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                    Image.asset("assets/Icon.png"),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Text(
                      textAlign: TextAlign.center,
                      "Avaliações \n 87",
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Projetos Avaliados",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Avaliações feitas por você",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
                            child: Text(
                              "Carreiras",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
