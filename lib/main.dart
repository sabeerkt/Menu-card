import 'package:flutter/material.dart';

import 'package:foodmenu/controller/cart_provider.dart';

import 'package:foodmenu/db_functions/db_function.dart';
import 'package:foodmenu/model/model.dart';

import 'package:foodmenu/widgets/splash.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(FoodAdapter().typeId)) {
    Hive.registerAdapter(FoodAdapter());
  }
  runApp(const MyApp());
  //loadCart();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => dbfunction(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SearchProvider(),
        // ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'food',
        home: SplashScreen(),
      ),
    );
  }
}
