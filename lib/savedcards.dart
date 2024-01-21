import 'package:flutter/material.dart';

class SavedItemsProvider extends ChangeNotifier {
  final List<String> _saveditems = [];

  List<String> get savedItems => _saveditems;

  void toggleSavedItem(String documentId) {
    if (_saveditems.contains(documentId)) {
      _saveditems.remove(documentId);
    } else {
      _saveditems.add(documentId);
    }
    notifyListeners();
  }

  // ignore: non_constant_identifier_names
  bool IsItemSaved(String documentId) {
    return _saveditems.contains(documentId);
  }
}
