import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_daily/components/custom_curved_appbar.dart';
import 'package:news_daily/components/global_navigatorkey.dart';
import 'package:news_daily/news_detail_page.dart';
import 'package:news_daily/providers/home_provider.dart';
import 'package:news_daily/settings_page.dart';
import 'package:news_daily/splash_page.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  List<Locale> allLocale = [
    const Locale('en', 'UK'),
    const Locale('es', 'ES'),
  ];
  runApp(EasyLocalization(
      supportedLocales: allLocale,
      fallbackLocale: const Locale('en', 'UK'),
      path: 'resources/langs',
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: Consumer<HomeProvider>(builder: (context, hp, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          darkTheme: hp.darkMode ? ThemeData.dark() : ThemeData.light(),
          navigatorKey: GlobalVariable.navState,
    
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: EasyLoading.init(),
          home: const SplashScreen(),
        );
      }),
    );
  }
}

