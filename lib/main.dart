import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/language_provider.dart';
import 'screens/home_screen.dart';

void main() {

  runApp(

    ChangeNotifierProvider(

      create: (_) => LanguageProvider(),

      child: MyApp(),

    ),

  );

}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: "Tomato Disease Detection",

      home: HomeScreen(),

    );

  }

}