import 'package:flutter/material.dart';
import 'package:news_daily/constants/app_images.dart';
import 'package:news_daily/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
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
            SizedBox(height: 200, width: 200, child: Image.asset(AppImage.splash)),
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
    });
  }
}
