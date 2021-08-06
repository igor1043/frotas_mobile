import 'package:flutter/material.dart';

import 'CardsMenu.dart';

class Home extends StatefulWidget {
  //
  Home() : super();

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CardsDashboard(),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class CardsDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: EdgeInsets.only(left: 1),
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        CardsMenu(
          title: "Veículos em Trânsito",
          value: "10",
          icon: Icons.local_shipping,
          color: Colors.green,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Pneus em Trânsito",
          value: "85",
          icon: Icons.trip_origin,
          color: Colors.green,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Veículos Cadastrados",
          value: "15",
          icon: Icons.directions_car,
          color: Colors.blue,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Motoristas Cadastrado",
          value: "18",
          icon: Icons.person,
          color: Colors.blue,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Pneus em Atraso",
          value: "45",
          icon: Icons.trip_origin,
          color: Colors.pink,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Habilitação em Atraso",
          value: "45",
          icon: Icons.feed,
          color: Colors.pink,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Manutenções em Atraso",
          value: "45",
          icon: Icons.handyman,
          color: Colors.pink,
          onTap: () {
            print("tapped");
          },
        ),
      ]),
    );
  }
}
