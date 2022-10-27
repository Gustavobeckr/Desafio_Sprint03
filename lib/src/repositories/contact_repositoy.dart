
import 'package:dio/dio.dart';

import '../models/text_model.dart';

class ContactRepository{
  late final Dio dio;
  final url = 'https://type.fit/api/quotes';

  ContactRepository([Dio? client]){
    if(client == null){
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }
  
  Future<List<TextModel>> fetchContacts()async{
    final response =  await dio.get(url);
    final list = response.data as List;

    List<TextModel> listCards = [];
    for(var json in list){
       final card = TextModel.fromJson(json);
       listCards.add(card);
    }
    return listCards;
  }
}