import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
   

bool darkMode=false;

changeMode(){
  darkMode=!darkMode;
  notifyListeners();
}


}