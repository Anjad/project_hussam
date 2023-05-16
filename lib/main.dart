import 'package:e_commarce/helper/Colorsys.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colorsys.orange,
        accentColor: Colorsys.orange,
      ),
      home: const SplashScreen(),
    );
  }
}
