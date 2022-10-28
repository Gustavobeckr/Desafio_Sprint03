import 'dart:convert';

import 'package:app_contacts/src/models/text_model.dart';
import 'package:flutter/cupertino.dart';
import '../repositories/text_repositoy.dart';
import 'package:dio/dio.dart';

class HomeController {
  List<TextModel> listCards = [];
  late final ContactRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([ContactRepository? repository]) {
    if (repository == null) {
      this._repository = ContactRepository();
    } else {
      this._repository = repository;
    }
  }

  Future start() async {
    final Dio dio = Dio();
    const baseUrl = 'https://type.fit/api/quotes';


    final response = await dio.get(baseUrl).then((value) {
      final jsonResult = jsonDecode(value.data);


      if (value.statusCode == 200) {
        for (var i = 0; i < 100; i++) {
          listCards.add(TextModel(
              text: jsonResult[i]['text'],
              author: jsonResult[i]['author']));
        }
      }
    });

    try {
      final Dio dio = Dio();
      const baseUrl = 'https://type.fit/api/quotes';
      state.value = HomeState.loadind;

      final response = await dio.get(baseUrl).then((value) {
        final jsonResult = jsonDecode(value.data);


        if (value.statusCode == 200) {
          for (var i = 0; i < 100; i++) {
            listCards.add(TextModel(
                text: jsonResult[i]['text'],
                author: jsonResult[i]['author']));
          }
        }
      });
      Future.delayed(Duration(seconds: 2), (){
        state.value = HomeState.success;
      });

    } catch (e) {
      state.value = HomeState.error;
    }
  }
}
enum HomeState { start, loadind, success, error }
