import 'package:flutter/cupertino.dart';
import 'package:rick_morty/utils/global.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  BottomNavigationBarProvider() {
    logger.d("Inside Bottom Bar Provider Constructor");
  }

  int _currentIndex = 0;

  get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
