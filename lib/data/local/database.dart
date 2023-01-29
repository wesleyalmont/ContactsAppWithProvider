import 'package:contactsprovider/constants/database_constants.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactsDbHelper {
  ContactsDbHelper._();

  static final ContactsDbHelper instance = ContactsDbHelper._();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await getDatabaseIntance();
    return _database!;
  }

  Future<Database> getDatabaseIntance() async {
    final dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, DatabaseConstants.dbName),
      onCreate: (db, version) {
        return db.execute('''
        CREATE TABLE ${DatabaseConstants.tableName} (
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          name TEXT,
          phone TEXT,
          birthday TEXT,
          createdAt TEXT,
          image TEXT,
          type TEXT
  )
''');
      },
      version: 1,
    );
  }
}
