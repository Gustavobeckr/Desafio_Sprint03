import 'package:sqflite/sqflite.dart';
import '../../models/contact_model.dart';
import '../app_database.dart';

class ContactDao {

  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_phoneNumber TEXT)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _phoneNumber = 'phone_number';

  Future<int> save(ContactModel contact) async {
    final Database db = await getDataBase();

    Map<String, dynamic> contactMap = _toMap(contact);

    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(ContactModel contact) {
    final Map<String, dynamic> contactMap = Map();

    contactMap[_name] = contact.name;
    contactMap[_phoneNumber] = contact.phoneNumber;
    return contactMap;
  }

  Future<List<ContactModel>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<ContactModel> contacts = _toList(result);
    return contacts;
  }

  List<ContactModel> _toList(List<Map<String, dynamic>> result) {
    final List<ContactModel> contacts = [];
    for (Map<String, dynamic> row in result) {
      final ContactModel contact = ContactModel(
        row[_name],
        row[_phoneNumber],
        row[_id],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
