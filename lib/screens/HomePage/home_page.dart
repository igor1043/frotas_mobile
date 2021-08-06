import 'package:flutter/material.dart';
import 'components/body.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text("DashBoard"),
        backgroundColor: Colors.cyan,
      ),
      body: Home(),

      //metodo para criar o botão de entrada do maps
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Mapas Offline'),
            content: const Text('Rastreamento em tempo real Indisponível'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Sair'),
                child: const Text('Sair'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        ),
        child: const Icon(Icons.location_on),
        backgroundColor: Colors.cyan,
      ),
    );
  }
}
