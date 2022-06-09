import 'package:flutter/cupertino.dart';

class Custom with ChangeNotifier {
  int heading = 0;
  int navbar = 0;

  changeheading(int value) {
    heading = value;
    notifyListeners();
  }

  changenabar(int value) {
    navbar = value;
    notifyListeners();
  }
}
