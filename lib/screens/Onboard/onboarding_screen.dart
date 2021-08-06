import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:frotas_mobile/screens/Auth/login.dart';
import 'package:frotas_mobile/screens/Onboard/assets.dart';
import 'package:frotas_mobile/screens/Onboard/network_image.dart';

class OnBoardPage extends StatefulWidget {
  static final String path = "lib/src/pages/onboarding/intro6.dart";
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  SwiperController _controller = SwiperController();
  int _currentIndex = 0;
  final List<String> titles = [
    "Bem Vindo Ao Frotas",
    "Monitoramento de tendências no uso de combustível e inatividade",
    "Otimização de rota",
  ];
  final List<String> subtitles = [
    "Gerencie os kms rodados por litro e motoristas com CNH vencida.",
    "Utilize a solução pra gerenciar o combustível da sua frota e reduza em até 25% os custos.",
    "Plataforma online que permite configurar as regras de operação, realizar novos pedidos e emitir relatórios em tempo real."
  ];
  final List<Color> colors = [
    Colors.green.shade300,
    Colors.blue.shade300,
    Colors.indigo.shade300,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Swiper(
            loop: false,
            index: _currentIndex,
            onIndexChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            controller: _controller,
            pagination: SwiperPagination(
              builder: DotSwiperPaginationBuilder(
                activeColor: Colors.red,
                activeSize: 20.0,
              ),
            ),
            itemCount: 3,
            itemBuilder: (context, index) {
              return IntroItem(
                title: titles[index],
                subtitle: subtitles[index],
                bg: colors[index],
                imageUrl: introIllus[index],
              );
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            // ignore: deprecated_member_use
            child: FlatButton(
              child: const Text("Pular"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon:
                  Icon(_currentIndex == 2 ? Icons.check : Icons.arrow_forward),
              onPressed: () {
                if (_currentIndex != 2) _controller.next();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class IntroItem extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Color? bg;
  final String? imageUrl;

  const IntroItem(
      {Key? key, required this.title, this.subtitle, this.bg, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bg ?? Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                    color: Colors.white),
              ),
              if (subtitle != null) ...[
                const SizedBox(height: 20.0),
                Text(
                  subtitle!,
                  style: TextStyle(color: Colors.white, fontSize: 24.0),
                  textAlign: TextAlign.center,
                ),
              ],
              const SizedBox(height: 40.0),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 70),
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Material(
                      elevation: 4.0,
                      child: PNetworkImage(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
