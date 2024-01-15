import "package:flutter/material.dart";
import "package:flutter/foundation.dart";

class SelectedItemProvider with ChangeNotifier {
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;

  void addItem(int value) {
    _selectedItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectedItem.remove(value);
    notifyListeners();
  }

  void clearAllItem() {
    _selectedItem.clear();
    notifyListeners();
  }
}
