import 'package:flutter/material.dart';
import 'package:frotas_mobile/screens/Auth/res/colors.dart';
import 'package:frotas_mobile/screens/Auth/res/constants.dart';
import 'package:frotas_mobile/screens/Auth/res/typography.dart';
import 'package:frotas_mobile/screens/Auth/register.dart';

import '../start.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBg,
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
            top: 0, left: 16.0, right: 16.0, bottom: 10.0),
        child: Stack(
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 70),
              padding:
                  const EdgeInsets.only(top: 80.0, left: 16.0, right: 16.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0),
                  color: Colors.white),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.account_circle),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            decoration:
                                InputDecoration(hintText: "CPF ou Email"),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Icon(Icons.lock),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: "Senha",
                                suffixIcon: GestureDetector(
                                  child: Icon(Icons.remove_red_eye),
                                  onTap: () {},
                                )),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16.0),
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.cyan,
                          textColor: Colors.white,
                          child: Text("Entrar".toUpperCase()),
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Start()),
                          ),
                        )),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      child: Text(
                        "Esqueci a Senha".toUpperCase(),
                        style: TextStyle(
                            color: Colors.cyan, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade600,
                        )),
                        const SizedBox(width: 10.0),
                        Text(
                          "Não é um Membro?",
                          style: smallText,
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                            child: Divider(
                          color: Colors.grey.shade600,
                        )),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    GestureDetector(
                      child: Text(
                        "Teste Gratis".toUpperCase(),
                        style: TextStyle(
                            color: Colors.cyan, fontWeight: FontWeight.w600),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, 'register');
                      },
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 10.0),
                alignment: Alignment.center,
                height: 150,
                child: Image.asset(
                  logo,
                  fit: BoxFit.contain,
                )),
          ],
        ),
      ),
    );
  }
}
