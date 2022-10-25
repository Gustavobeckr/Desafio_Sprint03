import 'package:app_contacts/src/models/ContactModel.dart';
import 'package:dio/dio.dart';

class ContactRepository{
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/todos';
  
  Future<List<ContactModel>> fetchCotacts()async{
    final response =  await dio.get(url);
    final list = response.data as List;

    List<ContactModel> contacts = [];
    for(var json in list){
       final contact = ContactModel.fromJson(json);
       contacts.add(contact);
    }
    return contacts;
  }
  
}