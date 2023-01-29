import 'package:contactsprovider/constants/database_constants.dart';
import 'package:contactsprovider/data/local/database.dart';
import 'package:contactsprovider/models/contact.dart';
import 'package:flutter/material.dart';

class ContactsProvider extends ChangeNotifier {
  // final List<ContactModel> _contactList = [];
  // get contacts => _contactList;

  Future<void> insert(
      {required String name,
      required String phone,
      required String birthday,
      required String image,
      required String type}) async {
    final contact = ContactModel(null,
        name: name,
        phone: phone,
        birthday: birthday,
        createdAt: DateTime.now().toString(),
        image: image,
        type: type);
    final db = await ContactsDbHelper.instance.database;
    db.insert(DatabaseConstants.tableName, contact.toMap());

    notifyListeners();
  }

  Future<List<ContactModel>> getAllContacts() async {
    final db = await ContactsDbHelper.instance.database;
    List<Map<String, dynamic>> response =
        await db.query(DatabaseConstants.tableName);
    List<ContactModel> _contactList = [];
    for (Map<String, dynamic> row in response) {
      _contactList.add(
        ContactModel(row['id'],
            name: row['name'],
            phone: row['phone'],
            birthday: row['birthday'],
            createdAt: row['createdAt'],
            image: row['image'],
            type: row['type']),
      );
    }
    return _contactList;
  }

  Future<void> remove(int id) async {
    // _contactList.removeWhere((element) => element.id == id);
    final db = await ContactsDbHelper.instance.database;
    await db
        .delete(DatabaseConstants.tableName, where: "id = ?", whereArgs: [id]);
    // notifyListeners();
  }
}
