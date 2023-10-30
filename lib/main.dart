import 'package:flutter/material.dart';
import 'package:foodmenu/Database/model/model.dart';
import 'package:foodmenu/splash.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();



  //  if (!Hive.isAdapterRegistered(categioryAdapter().typeId)) {
  //   Hive.registerAdapter(categoryAdapter());
  // }


  if (!Hive.isAdapterRegistered(FoodAdapter().typeId)) {
    Hive.registerAdapter(FoodAdapter());
  }
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
