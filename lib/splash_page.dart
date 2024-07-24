import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:news_daily/api/call_api.dart';
import 'package:news_daily/constants/app_images.dart';
import 'package:news_daily/home_page.dart';
import 'package:news_daily/main.dart';
import 'package:news_daily/providers/home_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    callApi();
    navigateToHome();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200, width: 200, child: SvgPicture.asset(AppImage.splashsvg, semanticsLabel: 'Acme Logo')),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Newsflash",
              style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  Future<void> callApi() async {
    HomeProvider homeProvider = Provider.of(context, listen: false);
    await homeProvider.fetchNewsApiCall();
  }
}
