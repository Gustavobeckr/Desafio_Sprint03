import 'package:dio/dio.dart';
import '../models/text_model.dart';

class ContactRepository{
  late final Dio dio;
  static const baseUrl = 'https://type.fit/api/quotes';

  ContactRepository([Dio? client]){
    if(client == null){
      this.dio = Dio();
    } else {
      this.dio = client;
    }
  }

  Future fetchText()async{
    late Response list;
      final response = await dio.get(baseUrl).then((value){
        list = value;
      });
      return list;
      // List<TextModel> listCards = [];
      // for (var json in list) {
      //   final card = TextModel.fromJson(json);
      //   listCards.add(card);
      // }
      // return listCards;
  }
}