import 'package:flutter/material.dart';
import './screen/home_screen.dart';

class PainMap extends StatelessWidget {
  const PainMap({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

