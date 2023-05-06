import 'package:easypaisa/screens/splash/view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      // scrollBehavior: const MaterialScrollBehavior(),
      theme: ThemeData(
        useMaterial3: true,
        // primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}
