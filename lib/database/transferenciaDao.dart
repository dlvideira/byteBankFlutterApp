import 'package:bytebank/models/transferencia.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class TransferenciaDao {
  static final String tableQuery = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_accountNumber INTEGER, '
      '$_value DOUBLE)';

  static const String _tableName = 'transfers';
  static const String _id = 'id';
  static const String _value = 'value';
  static const String _accountNumber = 'account_number';

  Future<int> save(Transferencia transferencia) async {
    final Database db = await getDatabase(tableQuery);
    Map<String, dynamic> transferMap = _toMap(transferencia);
    return db.insert(_tableName, transferMap);
  }

  Future<List<Transferencia>> findAll() async {
    final Database db = await getDatabase(tableQuery);
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Transferencia> transferencias = _toList(result);
    return transferencias;
  }

  Map<String, dynamic> _toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferMap = Map();
    transferMap[_accountNumber] = transferencia.conta;
    transferMap[_value] = transferencia.valor;
    return transferMap;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> result) {
    final List<Transferencia> transferencias = [];
    for (Map<String, dynamic> map in result) {
      var transferencia = Transferencia(
        map[_id],
        map[_accountNumber],
        map[_value],
      );
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}
