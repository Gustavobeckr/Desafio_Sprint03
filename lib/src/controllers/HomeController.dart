import 'package:flutter/cupertino.dart';

import '../models/ContactModel.dart';
import '../repositories/ContactRepositoy.dart';

class HomeController {
  List<ContactModel> contacts = [];
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
      contacts = await repository.fetchContacts();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loadind, success, error }
