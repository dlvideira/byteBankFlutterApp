import 'package:bytebank/models/contato.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class ContatoDao {
  static final String tableQuery = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase(tableQuery);
    Map<String, dynamic> contactMap = _toMap(contato);
    return db.insert(_tableName, contactMap);

    // return getDatabase().then((db) {
    //   final Map<String, dynamic> contactMap = Map();
    //   contactMap['name'] = contato.name;
    //   contactMap['account_number'] = contato.accountNumber;
    //   return db.insert('contacts', contactMap);
    // });
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase(tableQuery);
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contato> contatos = _toList(result);
    return contatos;

    // return getDatabase().then((db) {
    //   return db.query('contacts').then((maps) {
    //     final List<Contato> contatos = [];
    //     for (Map<String, dynamic> map in maps) {
    //       var contato = Contato(
    //         map['id'],
    //         map['name'],
    //         map['account_number'],
    //       );
    //       contatos.add(contato);
    //     }
    //     return contatos;
    //   });
    // });
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contato.name;
    contactMap[_accountNumber] = contato.accountNumber;
    return contactMap;
  }

  List<Contato> _toList(List<Map<String, dynamic>> result) {
    final List<Contato> contatos = [];
    for (Map<String, dynamic> map in result) {
      var contato = Contato(
        map[_id],
        map[_name],
        map[_accountNumber],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
