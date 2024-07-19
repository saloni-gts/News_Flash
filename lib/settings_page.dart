import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news_daily/components/custom_curved_appbar.dart';
import 'package:news_daily/components/global_navigatorkey.dart';
import 'package:news_daily/constants/app_languages.dart';
import 'package:news_daily/generated/locale_keys.g.dart';
import 'package:news_daily/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool isSwitched = false;

  @override
  void initState() {
    HomeProvider hp = Provider.of(context, listen: false);
    isSwitched = hp.darkMode;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomCurvedAppbar(
        title: tr(LocaleKeys.additionText_Settings),
        showBackIcon: true,
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            setting_card(
              tr(LocaleKeys.additionText_darkMode),
            ),
            const SizedBox(
              height: 10,
            ),
            language_card(
              tr(LocaleKeys.additionText_chngLang),
            ),
          ],
        ),
      )),
    );
  }

  Widget setting_card(String txt) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: const Color(0xffE3E3E3))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            children: [
              Text(
                txt,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SizedBox(
                    height: 20,
                    child: Switch(
                      value: isSwitched,
                      onChanged: onChanged,
                      activeColor: const Color.fromARGB(255, 93, 138, 221),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget language_card(String txt) {
    return Material(
      elevation: 2,
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: const Color(0xffE3E3E3))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
          child: Row(
            children: [
              Text(
                txt,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              InkWell(
                  onTapDown: (details) {
                    showMenu(
                      context: context,
                      position: RelativeRect.fromLTRB(
                        details.globalPosition.dx,
                        details.globalPosition.dy,
                        50,
                        0,
                      ),
                      items: [
                        PopupMenuItem(
                          value: 1,
                          child: dropdownItem("English", Colors.black),
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: dropdownItem("Spanish", Colors.black),
                        ),
                      ],
                      elevation: 8.0,
                    ).then((value) async {
                      print("value---- $value");
                      if (value == 1) {
                        await GlobalVariable.navState.currentContext?.setLocale(AppLanguage.english);
                      } else {
                        await GlobalVariable.navState.currentContext?.setLocale(AppLanguage.spanish);
                      }
                    });
                  },
                  child: const Icon(Icons.arrow_forward_ios_outlined))
            ],
          ),
        ),
      ),
    );
  }

  void onChanged(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }

    HomeProvider hp = Provider.of(context, listen: false);
    hp.changeMode();
  }

  dropdownItem(String title, Color color) {
    return Row(
      children: [
        const SizedBox(width: 10),
        Expanded(child: Text(title)),
      ],
    );
  }
}
