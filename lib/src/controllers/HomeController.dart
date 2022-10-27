import 'package:app_contacts/src/models/text_model.dart';
import 'package:flutter/cupertino.dart';

import '../repositories/contact_repositoy.dart';

class HomeController {
  List<TextModel> listCards = [];
  late final ContactRepository repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([ContactRepository? _repository]) {
    if (_repository == null) {
      this.repository = ContactRepository();
    } else {
      this.repository = _repository;
    }
  }

  Future start() async {
    state.value = HomeState.loadind;
    try {
      listCards = await repository.fetchContacts();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loadind, success, error }
