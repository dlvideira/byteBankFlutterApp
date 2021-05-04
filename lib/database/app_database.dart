import 'package:bytebank/database/contatoDao.dart';
import 'package:bytebank/database/transferenciaDao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase(query) async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TransferenciaDao.tableQuery);
      db.execute(ContatoDao.tableQuery);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
