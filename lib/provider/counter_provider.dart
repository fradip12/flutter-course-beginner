import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  int get counterValue => counter;

  void increement() {
    counter++;
    notifyListeners();
  }

  void decreement() {
    counter--;
    notifyListeners();
  }
}
