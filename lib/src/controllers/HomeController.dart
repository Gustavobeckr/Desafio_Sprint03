import 'dart:convert';

import 'package:app_contacts/src/models/text_model.dart';
import 'package:flutter/cupertino.dart';
import '../repositories/contact_repositoy.dart';
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
    state.value = HomeState.loadind;

    final response = await dio.get(baseUrl).then((value) {
      final jsonResult = jsonDecode(value.data);


      if (value.statusCode == 200) {
        for (var i = 0; i < 100; i++) {
          listCards.add(TextModel(
              text: jsonResult[i]['text'],
              author: jsonResult[i]['author']));

        }print(listCards);
      }
    });

try {
  await _repository.fetchText().then((value) {
    for(var i = 0; i < value.length; i++) {
      listCards = TextModel(text: value[i]['text'], author: value[i]['author']) as List<TextModel>;
    }
  });

  state.value = HomeState.success;
} catch (e) {
  print(listCards);
  state.value = HomeState.error;
}
  }
}

enum HomeState { start, loadind, success, error }
