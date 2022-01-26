import 'package:flutter/cupertino.dart';

class FormProvider with ChangeNotifier{
  String _name="";
  int _age=0;
  List<String> _list=[];

  String get name => _name;

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  int get age => _age;

  set age(int value) {
    _age = value;
    notifyListeners();
  }

  List<String> get list => _list;

  set list(List<String> value) {
    _list = value;
    notifyListeners();
  }
}