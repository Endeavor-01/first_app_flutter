

import 'package:flutter/cupertino.dart';

class TipCalculatorModel with ChangeNotifier{

  int _personCount = 1;
  double _tippercentage = 0.0;
  double _billtotal = 0.0;

//   get method for three

double get billTotal => _billtotal;
double get tipPercentage => _tippercentage;
int get personCount => _personCount;

void updateBill(double billTotal){
  _billtotal  = billTotal;
  notifyListeners();
}
void updateTip(double tipPercentage){
  _tippercentage = tipPercentage;
  notifyListeners();
}
void updatePersonCount(int personCount){
  _personCount = personCount;
  notifyListeners();
}

double get totalPerPerson =>
    ((_billtotal*_tippercentage)+(_billtotal)) /_personCount;

}