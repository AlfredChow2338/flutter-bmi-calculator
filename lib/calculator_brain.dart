import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});
  final int height;
  final int weight;
  late double _bmi = (weight / pow(height / 100, 2));
  String getBMI() {
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi > 25.0) {
      return 'Overweight';
    } else if (_bmi < 18.4) {
      return 'Underweight';
    } else {
      return 'Normal';
    }
  }

  String getDescription() {
    if (_bmi > 25.0) {
      return 'You are overweight. Try to exercise more!';
    } else if (_bmi < 18.4) {
      return 'You are underweight. Try to eat more!';
    } else {
      return 'You have normal BMI. Congrats!';
    }
  }
}
