import 'package:easypaisa/screens/home/view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Container(
              padding: EdgeInsets.only(right: 10),
              child: Image.asset('assets/images/splash.jpg'))),
    );
  }
}
