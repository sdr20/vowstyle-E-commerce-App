import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/custom_design_screen.dart';
import 'screens/expert_tailoring_screen.dart';
import 'screens/premium_fabrics_screen.dart';

void main() {
  runApp(VowStyleApp());
}

class VowStyleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VowStyle | Wedding Wardrobe Designer',
      theme: ThemeData(
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Playfair Display',
            fontWeight: FontWeight.bold,
            fontSize: 36,
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        '/custom_design': (context) => CustomDesignScreen(),
        '/expert_design': (context) => ExpertTailoringScreen(),
        '/premium_design': (context) => PremiumFabricsScreen(),
      },
    );
  }
}
