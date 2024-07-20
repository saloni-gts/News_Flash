import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_daily/api/network_calls.dart';
import 'package:news_daily/api/news_data_model.dart';
import 'package:news_daily/api/resource.dart';

class AppApi{
  static final netWorkCalls = NetworkCalls();

  static Future<List<Articles>> resourceGet(String url, {bool sendToken = false}) async {
    print("############ START GET API   \n\nApi Url:>> $url \n");
    return commonGetMethod(url).then((response) async {
      print(">>>>>>>> response $response");
      NewsData? baseApiModel = NewsData.fromJson(jsonDecode(response));
      print(
          "\nApi Data status>>> \n${baseApiModel.status}  \n\Articles :>>>> \n${baseApiModel.articles}   \n\total results :>>>> \n${baseApiModel.totalResults}\n\nEND ###############\n\n ");
      if (baseApiModel.status == 'ok') {
        return baseApiModel.articles??[];
      }  else {
        EasyLoading.showToast("Something went wrong!");
        return [];
      }
    });
  }



    Future<List<Articles>> fetchNewsApi() async {
    return await resourceGet(ApiUrl.fetchNews,).then((response) {
      return response;
    });
  }
  
  static Future commonGetMethod(String url) async {

 
    var response = await netWorkCalls.get(url);
    return response;
  }







}



  class ApiUrl{
      static String fetchNews = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=d79e97511f52434590a3e2f65f56c29d";
      // https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=
  }