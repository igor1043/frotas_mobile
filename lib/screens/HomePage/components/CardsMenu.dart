import 'package:flutter/material.dart';

class CardsMenu extends StatelessWidget {
  final String title;
  final String value;
  final Color color;
  final Function onTap;
  final IconData icon;

  const CardsMenu(
      {Key? key,
      required this.title,
      required this.value,
      required this.color,
      required this.icon,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 150,
        width: 150,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.all(Radius.circular(14))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  _icon(color, icon),
                  Container(
                      height: 50,
                      width: 80,
                      alignment: Alignment.center,
                      child: _value(value))
                ]),
            SizedBox(height: 14),
            Text(title,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}

Widget _value(String value) {
  return Container(
    child: Text(value,
        style: TextStyle(
            fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold)),
  );
}

Widget _icon(Color color, IconData icon) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))),
    child: Icon(icon, color: color, size: 40),
  );
}
