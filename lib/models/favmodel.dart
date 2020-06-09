import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:nofomo/models/store.dart';

class FavModel extends ChangeNotifier {
  final List<Store> _favStores = [];

  List<Store> get favStores => _favStores;

  bool alreadySaved(Store store) {
     return _favStores.contains(store);
  }

  void add(Store store) {
    _favStores.add(store);
    notifyListeners();
  }

  void remove(Store store) {
    _favStores.remove(store);
    notifyListeners();
  }
}