import 'package:bmicalculator/results_page.dart';
import 'package:flutter/material.dart';
import 'package:bmicalculator/input_page.dart';

void main() {
  runApp(const BMICalculator());
}

const defaultColor = Color(0xFF0A0E21);

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: const ColorScheme.dark().copyWith(
            primary: defaultColor,
          ),
          appBarTheme: const AppBarTheme(
            color: defaultColor,
          ),
          scaffoldBackgroundColor: defaultColor,
          textTheme:
              const TextTheme(bodyMedium: TextStyle(color: Colors.white))),
      // home: const InputPage(),
      routes: {
        '/':(context) => const InputPage(),
        '/results':(context) => const ResultsPage()
      },
    );
  }
}
