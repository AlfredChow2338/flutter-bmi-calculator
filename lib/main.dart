import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'screens/results_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFF0A0E22),
          scaffoldBackgroundColor: Color(0xFF0A0E22),
          textTheme: TextTheme(
            body1: TextStyle(color: Color(0xFFFFFFFF)),
          )),
      home: InputPage(),
    );
  }
}
