// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> es_ES = {
  "additionText": {
    "errorr": "Error",
    "success": "Éxito",
    "warnig": "Advertencia",
    "Settings": "Configuraciones",
    "darkMode": "Modo Oscuro",
    "chngLang": "Cambiar Idioma",
    "smallContinue": "Continuar"
  }
};
static const Map<String,dynamic> en_UK = {
  "additionText": {
    "errorr": "Error",
    "success": "Success",
    "warnig": "Warning",
    "Settings": "Settings",
    "darkMode": "Dark Mode",
    "chngLang": "Change Language",
    "smallContinue": "Continue"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"es_ES": es_ES, "en_UK": en_UK};
}
