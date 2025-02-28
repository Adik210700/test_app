import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String name = 'Albus Dumbledore';

  String image =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqsFTMdBRWk94r-jZJ6z4NJ43D4SD84JkaLA&s';

  void changeUserName(String newName) {
    name = newName;
    notifyListeners();
  }
}
