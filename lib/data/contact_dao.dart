import 'package:contacts_app/data/contact.dart';
import 'package:contacts_app/data/database.dart';

class ContactsDao {
  final _dbHelper = DBHelper.db;

  Future<int> createContact(Contact contact) async {
    final db = await _dbHelper.database;
    var result = db.insert(CONTACT_TABLE, contact.toDBJson());
    return result;
  }

  Future<List<Contact>> getContacts(
      {List<String> columns, String query}) async {
    final db = await _dbHelper.database;

    List<Map<String, dynamic>> result;
    if (query != null) {
      if (query.isNotEmpty)
        result = await db.query(CONTACT_TABLE,
            columns: columns,
            where: 'name LIKE ?',
            whereArgs: ["%$query%"]);
    } else {
      result = await db.query(CONTACT_TABLE, columns: columns);
    }

    List<Contact> todos = result.isNotEmpty
        ? result.map((item) => Contact.fromDBJson(item)).toList()
        : [];
    return todos;
  }

  Future<int> updateTodo(Contact contact) async {
    final db = await _dbHelper.database;

    var result = await db.update(CONTACT_TABLE, contact.toDBJson(),
        where: "id = ?", whereArgs: [contact.id]);

    return result;
  }
}
