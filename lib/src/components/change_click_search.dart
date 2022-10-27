import 'package:flutter/material.dart';

class ChangeClick extends ChangeNotifier{
  bool clickSearch = true;

  ChangeClick({required this.clickSearch});

  void changeClickSearch() {
    clickSearch = !clickSearch;
    notifyListeners();
  }

}