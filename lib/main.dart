import 'package:e_commarce/helper/Colorsys.dart';
import 'package:e_commarce/screens/main_screen.dart';
import 'package:e_commarce/screens/splash_screen.dart';
import 'package:e_commarce/screens/visual_design.dart';
import 'package:flutter/material.dart';

import 'screens/list.dart';

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
      ),
      home: const SplashScreen(),
    );
  }
}
