import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:news_daily/components/custom_curved_appbar.dart';
import 'package:news_daily/components/global_navigatorkey.dart';
import 'package:news_daily/providers/home_provider.dart';
import 'package:news_daily/settings_page.dart';
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(create: (_) => HomeProvider()),
      ],
      child: Consumer<HomeProvider>(builder: (context, hp, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          darkTheme: hp.darkMode ? ThemeData.dark() : ThemeData.light(),
          navigatorKey: GlobalVariable.navState,
          // navigatorObservers: [navigatorObserver],
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          builder: EasyLoading.init(),
          home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCurvedAppbar(
        title: "Newsflash",
        showBackIcon: false,
        isTitleCenter: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: ListView.builder(
            itemCount: 8,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(Radius.circular(12)),
                        border: Border.all(color: const Color.fromARGB(255, 190, 187, 187))),
                  ),
                ),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingScreen()));
        },
        tooltip: 'Increment',
        backgroundColor: const Color.fromARGB(255, 93, 138, 221),
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }
}
