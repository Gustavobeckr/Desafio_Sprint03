import 'package:app_contacts/src/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactRepository{
  late final Dio dio;
  final url = 'https://mocki.io/v1/43b66c59-2ed5-4e95-bd61-4b8b21b2bb01';

  ContactRepository([Dio? client]){
    if(client == null){
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }
  
  Future<List<ContactModel>> fetchContacts()async{
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