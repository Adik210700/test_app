import 'package:flutter/material.dart';

class HomeBgProvider extends ChangeNotifier {
  Color activeColor = Colors.grey;

  void changeBgColot(Color newColor) {
    activeColor = newColor;
    notifyListeners();
  }
}
