import 'package:flutter/cupertino.dart';

class CounterBloc extends ChangeNotifier{

  int _counter = 0;
  int _affected = 3324;
  int _death = 1532;
  int _recovered = 5432;
  int _active = 344556;
  int _serious = 7324;


  increment(){
    counter++;
    affected++;
    death++;
    recovered++;
    active++;
    serious++;
  }

  decrement(){
    counter--;
    affected--;
    death--;
    recovered--;
    active--;
    serious--;

  }

  set counter(val) {
    _counter = val;
    notifyListeners();
  }
  int get counter => _counter;

  set affected(val2){
    _affected = val2;
    notifyListeners();
  }
  int get affected => _affected;

  set death(val3){
    _death = val3;
    notifyListeners();
  }
  int get death => _death;

  set recovered(val4){
    _recovered = val4;
    notifyListeners();
  }
  int get recovered => _recovered;

  set active(val5){
    _active = val5;
    notifyListeners();
  }
  int get active => _active;

  set serious(val6){
    _serious = val6;
    notifyListeners();
  }
  int get serious => _serious;

}