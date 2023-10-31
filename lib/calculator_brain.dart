import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({required this.height, required this.weight});

  final int weight;
  final int height;

  double _bmi = 0;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    print(_bmi);
    print(weight);
    print(height);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Please take care of yourself.';
    } else if (_bmi > 18.5) {
      return 'You have a normal body weight. Continue to take care of yourself.';
    } else {
      return 'You have a lower than normal body weight. Please take care of yourself';
    }
  }
}
