import 'package:flutter/material.dart';
import 'package:frotas_mobile/models/mysql.dart';
import 'CardsMenu.dart';

class Home extends StatefulWidget {
  //
  Home() : super();

  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {
  var cod_empresa = 1;
  var db = new Mysql();

  //variaveis para os cartoes de inicio que serão alteradas via sql
  var vei_tran = 0,
      pneu_tran = 0,
      vei_cas = 0,
      mot_cad = 0,
      pneu_atra = 0,
      habi_atra = 0,
      manu_atra = 0;

//requisições em sql
  void consultasql() {
    db.getConnection().then((conn) {
      String sql =
          'select count(status_viagem) from viagem  WHERE status_viagem = "Em Transito" AND cod_empresa= $cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            vei_tran = row[0];
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql =
          'select count(cod_mov_pneu) from view_pneu_geral WHERE acao_mov_pneu ="transito" AND cod_empresa=$cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            pneu_tran = row[0];
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql =
          'select count(cod_veiculo) from veiculo  WHERE cod_empresa= $cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            vei_cas = row[0];
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql =
          'select count(cod_motorista) from motorista WHERE cod_empresa=$cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            mot_cad = row[0];
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql =
          'select count(cod_mov_pneu) from view_pneu_geral  WHERE status_saude = "troca_imediata" AND cod_empresa= $cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            pneu_atra = row[0];
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql =
          'select count(cod_motorista) from view_motorista  WHERE status_cnh = "Atrasado" AND cod_empresa= $cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            habi_atra = row[0];
          });
        }
      });
      conn.close();
    });
    db.getConnection().then((conn) {
      String sql =
          'select count(cod_manutencao_servico) from view_manutencao_servico  WHERE status_manut = "Atrasado" AND cod_empresa= $cod_empresa';
      conn.query(sql).then((results) {
        for (var row in results) {
          setState(() {
            manu_atra = row[0];
          });
        }
      });
      conn.close();
    });
  }

  @override
  void initState() {
    super.initState();
    consultasql();
  }

  //Retorno da tela de dashboard
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CardsDashboard('$vei_tran', '$pneu_tran', '$vei_cas', '$mot_cad',
              '$pneu_atra', '$habi_atra', '$manu_atra'),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}

class CardsDashboard extends StatelessWidget {
  final String V1, V2, V3, V4, V5, V6, V7;

  const CardsDashboard(
      this.V1, this.V2, this.V3, this.V4, this.V5, this.V6, this.V7);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: EdgeInsets.only(left: 1),
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        CardsMenu(
          title: "Veículos em Trânsito",
          value: V1,
          icon: Icons.local_shipping,
          color: Colors.green,
          onTap: () {
            method() => _Home().consultasql();
          },
        ),
        CardsMenu(
          title: "Pneus em Trânsito",
          value: V2,
          icon: Icons.trip_origin,
          color: Colors.green,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Veículos Cadastrados",
          value: V3,
          icon: Icons.directions_car,
          color: Colors.blue,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Motoristas Cadastrados",
          value: V4,
          icon: Icons.person,
          color: Colors.blue,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Pneus em Atraso",
          value: V5,
          icon: Icons.trip_origin,
          color: Colors.pink,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Habilitação em Atraso",
          value: V6,
          icon: Icons.feed,
          color: Colors.pink,
          onTap: () {
            print("tapped");
          },
        ),
        CardsMenu(
          title: "Manutenções em Atraso",
          value: V7,
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
