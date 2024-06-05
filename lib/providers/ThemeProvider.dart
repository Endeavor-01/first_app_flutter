
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{

  bool _isDark = true ;

  bool get isdark => _isDark;

  void toggleButton(){
    _isDark = !_isDark;
    notifyListeners();

  }

  ThemeData get currentTheme{
    return _isDark ? ThemeData.dark() : ThemeData.light();
  }
}