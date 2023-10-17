// ignore: unused_import

import 'package:flutter/material.dart';
import 'package:foodmenu/splash.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'food',
      home: SplashScreen(),
    );
  }
}
