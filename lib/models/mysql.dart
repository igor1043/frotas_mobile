import 'package:mysql1/mysql1.dart';

class Mysql {
  static String host = '198.100.153.75',
      user = 'metasolu_projetos',
      password = 'fvi&l*f?2x]V',
      db = 'metasolu_controle_frota';
  static int port = 3306;

  Mysql();

  Future<MySqlConnection> getConnection() async {
    var settings = ConnectionSettings(
        host: host, port: port, user: user, password: password, db: db);
    return await MySqlConnection.connect(settings);
  }
}
