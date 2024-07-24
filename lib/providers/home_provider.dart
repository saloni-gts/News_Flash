import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_daily/api/call_api.dart';
import 'package:news_daily/api/news_data_model.dart';
import 'package:news_daily/components/global_navigatorkey.dart';
import 'package:news_daily/generated/locale_keys.g.dart';

class HomeProvider extends ChangeNotifier {
  AppApi api = AppApi();
  bool darkMode = false;

  bool loader = false;
  updateLoader(bool status) async {
    loaderUpdate(status);

    loader = status;
    await Future.delayed(const Duration(seconds: 0));
    notifyListeners();
  }

  loaderUpdate(bool status) {
    if (status) {
      EasyLoading.show(status: "Loading", maskType: EasyLoadingMaskType.clear);
    } else {
      EasyLoading.dismiss();
    }
  }

  changeMode() {
    Future.delayed(Duration.zero, () async {
      darkMode = !darkMode;
      notifyListeners();
    });
  }

  List<Articles> newsAritcles = [];

  fetchNewsApiCall() async {
    newsAritcles = [];
    try {
      updateLoader(true);
      newsAritcles = await api.fetchNewsApi();
      updateLoader(false);
      print("newsAritcles lenght---- ${newsAritcles.length}");
    } catch (erorr, stackTrace) {
      updateLoader(false);
      print("error--- > $erorr stack--- $stackTrace");
    }
    updateLoader(false);
    notifyListeners();
  }

  var category = "general";

  setCategory(val) {
    Future.delayed(Duration.zero, () async {
      category = val;
      notifyListeners();
    }).then((value) async {
      await fetchNewsApiCall();
    });
  }

  LangChange(val) {
    Future.delayed(Duration.zero, () async {
        bool isSelected(BuildContext context) => val == context.locale;
      await GlobalVariable.navState.currentContext?.setLocale(val);

    });
  }
}
