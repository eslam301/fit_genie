import 'package:flutter/cupertino.dart';

class HoveViewProvider extends ChangeNotifier {
  int? steps;
  int exerciseCalories = 0;
  int? foodCalories;
  int? exerciseTime;
  int? baseGoal;
  int? heartRate;
  int? activeCalories;
  int? time;

  void changeExerciseCalories (int value) {
    exerciseCalories = value;
    notifyListeners();
  }
}