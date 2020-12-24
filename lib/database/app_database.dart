import 'package:ByteBankApp/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await  getDatabasesPath(), 'bytebanck.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute(ContactDao.tableSql);
    }, version: 1,
    // onDowngrade:  onDatabaseDowngradeDelete,
    );
}
