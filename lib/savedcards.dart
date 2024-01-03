import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SavedItemsProvider extends ChangeNotifier {
  List<String> _saveditems = [];

  List<String> get savedItems => _saveditems;

  void toggleSavedItem(String documentId) {
    if (_saveditems.contains(documentId)) {
      _saveditems.remove(documentId);
    } else {
      _saveditems.add(documentId);
    }
    notifyListeners();
  }

  bool IsItemSaved(String documentId) {
    return _saveditems.contains(documentId);
  }
}
