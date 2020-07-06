import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

const String DB_NAME = "contacts_app.db";
const String CONTACT_TABLE = "contacts";

class DBHelper {
  DBHelper._();

  static final DBHelper db = DBHelper._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await createDatabase();
    return _database;
  }

  createDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    //"ReactiveTodo.db is our database instance name
    String path = join(
      documentsDirectory.path,
    );
    var database = await openDatabase(path, version: 1, onCreate: initDB);
    return database;
  }

  initDB(Database db, int version) async {
    Directory documentsDir = await getApplicationDocumentsDirectory();
    String path = join(documentsDir.path, DB_NAME);

    return await openDatabase(path, version: 1, onOpen: (db) async {},
        onCreate: (Database db, int version) async {
      // Create the note table
      await db.execute('''
                CREATE TABLE $CONTACT_TABLE(
                    id INTEGER PRIMARY KEY,
                    name TEXT DEFAULT,
                    mobile_no TEXT DEFAULT,
                    landline_no TEXT DEFAULT,
                    avatar_path TEXT DEFAULT,
                    isFavorite INTEGER DEFAULT
                    )
            ''');
    });
  }
}
