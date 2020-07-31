import 'package:flutter/foundation.dart';
import 'package:onelab_experiments/domain/interface/properties.dart';

class PropertiesChanger extends ChangeNotifier {
  Properties _state;

  Properties get state => _state;

  PropertiesChanger(Properties initialState) {
    _state = initialState;
  }

  void change(Properties state) {
    _state = state;
    notifyListeners();
  }
}
