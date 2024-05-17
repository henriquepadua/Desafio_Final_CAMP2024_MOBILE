import 'package:flutter/material.dart';
import 'BuscarPageView.dart'; // Certifique-se de que o caminho esteja correto
import 'LoginPageView.dart'; // Certifique-se de que o caminho esteja correto

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static final List<Widget> _pages = <Widget>[
    //HomeContent(), // Conteúdo real da HomePageView
    BuscarPageView(),
    HomeContent()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {},
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [  
            //BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: _pages,
        ),
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
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
          const Center(
            child: Text(
              "Karina Camp",
              style: TextStyle(fontSize: 30),
            ),
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Area de Design * ",
                style: TextStyle(fontSize: 20),
              ),
              Text(
                "Estagiária",
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              Image.asset("assets/Caledarioplanta.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 15)),
              const Text(
                "É SEMENTE HÁ \n 1 ANO",
                style: TextStyle(fontSize: 15),
              ),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
              Image.asset("assets/Icon.png"),
              const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
              const Text(
                textAlign: TextAlign.center,
                "Avaliações \n 87",
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          Row(
            children: [
              const Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Avaliações feitas por você",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Carreiras",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: 350,
            height: 120,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: Image.asset("assets/ImageAvatar.png"),
                    title: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                        ),
                        Text(
                          'Lucas Santos',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20)),
                        Text(
                          'Peoduct Design',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 63),),
                      const Icon(Icons.timer_sharp),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          'Feita há 3 meses',
                          style:
                              TextStyle(color: Colors.black.withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Adicione os outros cards da mesma maneira
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


// import 'package:Mobile/views/BuscarPageView.dart';
// import 'package:Mobile/views/LoginPageView.dart';
// import 'package:flutter/material.dart';

// class HomePageView extends StatefulWidget {
//   const HomePageView({super.key});

//   @override
//   State<HomePageView> createState() => _HomePageViewState();
// }

// class _HomePageViewState extends State<HomePageView> {
//   int _selectedIndex = 0;
//   PageController _pageController = PageController();

//   static List<Widget> _pages = <Widget>[
//     HomePageView(),
//     BuscarPageView(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//     _pageController.jumpToPage(index);
//   }
//   int _cardCount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () {
//                 // Adicione aqui a ação para voltar
//                 Navigator.of(context).pop();
//               },
//             ),
//             backgroundColor: Colors.black,
//             actions: [
//               IconButton(
//                 icon: const Icon(Icons.settings, color: Colors.white),
//                 onPressed: () {},
//               ),
//             ],
//           ),
//           bottomNavigationBar: BottomNavigationBar(
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.search), label: "Buscar"),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person), label: "Perfil"),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.symmetric(vertical: 10),
//                 ),
//                 const Center(
//                   child: CircleAvatar(
//                     maxRadius: 50,
//                     minRadius: 10,
//                     child: Icon(Icons.person_2, size: 50),
//                   ),
//                 ),
//                 const Center(
//                   child: Text(
//                     "Karina Camp",
//                     style: TextStyle(fontSize: 30),
//                   ),
//                 ),
//                 const Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       "Area de Design * ",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                     Text(
//                       "Estagiária",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10)),
//                     Image.asset("assets/Caledarioplanta.png"),
//                     const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 15)),
//                     const Text(
//                       "É SEMENTE HÁ \n 1 ANO",
//                       style: TextStyle(fontSize: 15),
//                     ),
//                     const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 20)),
//                     Image.asset("assets/Icon.png"),
//                     const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 10)),
//                     const Text(
//                       textAlign: TextAlign.center,
//                       "Avaliações \n 87",
//                       style: TextStyle(
//                         fontSize: 15,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     // Expanded(
//                     //   child: TextButton(
//                     //     onPressed: () {
//                     //       setState(() {
//                     //         // Incrementa o contador de cards quando o botão é pressionado
//                     //         if (_cardCount == 0) {
//                     //           _cardCount = 3;
//                     //         } else if (_cardCount == 3) {
//                     //           _cardCount = 0;
//                     //         }
//                     //       });
//                     //     },
//                     //     child: const Text(
//                     //       "Projetos \nAvaliados",
//                     //       style: TextStyle(
//                     //         color: Colors.black,
//                     //         fontSize: 13,
//                     //         fontWeight: FontWeight.bold,
//                     //       ),
//                     //     ),
//                     //   ),
//                     // ),
//                     // Renderiza os cards com base no valor de _cardCount
//                     // for (int i = 0; i < _cardCount; i++)
//                     //   Column(
//                     //     children: [
//                     //       Card(
//                     //         child: Padding(
//                     //           padding: const EdgeInsets.all(8.0),
//                     //           child: Text("Card ${i + 1}"),
//                     //         ),
//                     //       ),
//                     //     ],
//                     //   ),
//                     // Expanded(
//                     //   child: TextButton(
//                     //     onPressed: () {
//                     //       setState(() {});
//                     //       const Card(
//                     //         child: Text("fdsfsdfsd"),
//                     //       );
//                     //     },
//                     //     child: const Text(
//                     //       "Projetos \nAvaliados",
//                     //       style: TextStyle(
//                     //           color: Colors.black,
//                     //           fontSize: 13,
//                     //           fontWeight: FontWeight.bold),
//                     //     ),
//                     //   ),
//                     // ),
//                     const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 40)),
//                     Row(
//                       children: [
//                         TextButton(
//                           onPressed: () {},
//                           child: const Text(
//                             "Avaliações feitas por você",
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: 13,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ],
//                     ),
//                     Row(
//                       children: [
//                         TextButton(
//                             onPressed: () {},
//                             child: const Text(
//                               "Carreiras",
//                               style: TextStyle(
//                                   color: Colors.black,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                       ],
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 350,
//                   height: 120,
//                   child: Card(
//                     clipBehavior: Clip.antiAlias,
//                     child: Column(
//                       children: [
//                         ListTile(
//                           leading: Image.asset("assets/ImageAvatar.png"),
//                           title: const Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                               ),
//                               Text(
//                                 'Lucas Santos',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           subtitle: Row(
//                             children: [
//                               const Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20)),
//                               Text(
//                                 'Peoduct Design',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 63)),
//                             const Icon(Icons.timer_sharp),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 15.0),
//                               child: Text(
//                                 'Feita há 3 meses',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 350,
//                   height: 120,
//                   child: Card(
//                     clipBehavior: Clip.antiAlias,
//                     child: Column(
//                       children: [
//                         ListTile(
//                           leading: Image.asset("assets/ImageAvatar.png"),
//                           title: const Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                               ),
//                               Text(
//                                 'Lucas Santos',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           subtitle: Row(
//                             children: [
//                               const Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20)),
//                               Text(
//                                 'Peoduct Design',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 63)),
//                             const Icon(Icons.timer_sharp),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 15.0),
//                               child: Text(
//                                 'Feita há 3 meses',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 350,
//                   height: 120,
//                   child: Card(
//                     clipBehavior: Clip.antiAlias,
//                     child: Column(
//                       children: [
//                         ListTile(
//                           leading: Image.asset("assets/ImageAvatar.png"),
//                           title: const Row(
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 20),
//                               ),
//                               Text(
//                                 'Lucas Santos',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                           subtitle: Row(
//                             children: [
//                               const Padding(
//                                   padding:
//                                       EdgeInsets.symmetric(horizontal: 20)),
//                               Text(
//                                 'Peoduct Design',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ],
//                           ),
//                         ),
//                         Row(
//                           children: [
//                             const Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 63)),
//                             const Icon(Icons.timer_sharp),
//                             Padding(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 15.0),
//                               child: Text(
//                                 'Feita há 3 meses',
//                                 style: TextStyle(
//                                     color: Colors.black.withOpacity(0.6)),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all<Color>(Colors.black),
//                     ),
//                     onPressed: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                             builder: (context) => const HomePageView()),
//                       );
//                     },
//                     child: const Text(
//                       "Carregar mais projetos",
//                       style: TextStyle(
//                         fontSize: 17,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//               ],
//             ),
//           )),
//     );
//   }
// }
