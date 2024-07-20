import 'package:flutter/material.dart';
import 'package:news_daily/api/call_api.dart';
import 'package:news_daily/api/news_data_model.dart';

class HomeProvider extends ChangeNotifier {
   
  AppApi api = AppApi();
bool darkMode=false;

changeMode(){
  darkMode=!darkMode;
  notifyListeners();
}

List<Articles> newsAritcles=[];

fetchNewsApiCall() async {
  newsAritcles=[];
try{
   newsAritcles=await api.fetchNewsApi();
   print("newsAritcles lenght---- ${newsAritcles.length}");
   }catch(erorr,stackTrace){
  print("error--- > $erorr stack--- $stackTrace");
}


}


}