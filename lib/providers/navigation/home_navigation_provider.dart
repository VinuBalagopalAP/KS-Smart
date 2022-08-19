import 'package:flutter/material.dart';

class HomeNavigation extends ChangeNotifier {
  /// [ currentIndex ] is the index of the [ currentPage ]
  int _currentIndex = 0;

  /// [ currentIndex ] is the getter for [ currentIndex ]
  int get currentIndex => _currentIndex;

  /// [ setIndex ] is the function to set the [ currentIndex ]
  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
