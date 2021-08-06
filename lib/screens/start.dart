import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:frotas_mobile/Screens/HomePage/home_page.dart';

void main() => runApp(Start());

class Start extends StatelessWidget {
  // Este widget é a raiz do aplicativo.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  //criando a barra de navegação inferior
  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
          size: 27,
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "DashBoard",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.assignment,
          size: 27,
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Cadastros",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_shipping, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Viagens",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.construction, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Manutenção",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.trip_origin, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Pneus",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        )),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_circle, size: 27),
        title: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "Perfil",
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ))
  ];
  int selectedIndex = 0;

  List<Widget> pages = [
    Homepage(),
    const Center(
      child: Text(
        "Viagens",
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        "Viagens",
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        "Manutenções",
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        "Pneus",
        style: TextStyle(fontSize: 40),
      ),
    ),
    const Center(
      child: Text(
        "Viagens",
        style: TextStyle(fontSize: 40),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: BottomNavigationBar(
          items: items,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          selectedItemColor: Colors.cyan,
          currentIndex: selectedIndex,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget getBody() {
    return pages.elementAt(selectedIndex);
  }
}
