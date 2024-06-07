import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  int? steps;
  int exerciseCalories = 0;
  int foodCalories = 0;
  DateTime exerciseTime = DateTime.utc(1970, 1, 1);
  int? baseGoal;
  int? heartRate;
  int? activeCalories;
  DateTime time = DateTime.fromMillisecondsSinceEpoch(0);
  int pageIndex = 0;

  Future<void> addExerciseCalories({int value = 0, String time = ''}) async {
    exerciseCalories += value;

    var pref = await SharedPreferences.getInstance();
    await pref.setInt('exerciseCalories', exerciseCalories);

    exerciseTime = exerciseTime.add(Duration(minutes: int.parse(time)));
    //print("exTime $exerciseTime");

    await pref.setInt('timestamp', DateTime.now().millisecondsSinceEpoch);
    await pref.setString('ExerciseTime', exerciseTime.toIso8601String());

    notifyListeners();
  }

  Future<void> addFoodCalories(int value) async {
    foodCalories += value;
    var pref = await SharedPreferences.getInstance();
    await pref.setInt('foodCalories', foodCalories);
    await pref.setInt('timestamp', DateTime.now().millisecondsSinceEpoch);
    notifyListeners();
  }

  Future<void> updateDataDashboard() async {
    var pref = await SharedPreferences.getInstance();
    int? lastTimestamp = pref.getInt('timestamp');
    if (lastTimestamp != null) {
      DateTime lastTime = DateTime.fromMillisecondsSinceEpoch(lastTimestamp);
      if (DateTime.now().difference(lastTime).inMinutes >= 3) {
        pref.setInt('exerciseCalories', 0);
        pref.setInt('foodCalories', 0);
        pref.setInt('timestamp', DateTime.now().millisecondsSinceEpoch);
        pref.setInt('baseGoal', 2000);
        pref.setString(
            'ExerciseTime', DateTime.utc(1970, 1, 1).toIso8601String());
      } else {
        exerciseCalories = pref.getInt('exerciseCalories') ?? 0;
        foodCalories = pref.getInt('foodCalories') ?? 0;
        baseGoal = pref.getInt('baseGoal');
        exerciseTime = DateTime.parse(pref.getString('ExerciseTime') ?? '');
        //print('Last timestamp: $lastTimestamp');
      }
    } else {
      exerciseCalories = pref.getInt('exerciseCalories') ?? 0;
      foodCalories = pref.getInt('foodCalories') ?? 0;
      baseGoal = pref.getInt('baseGoal') ?? 2000;
      exerciseTime = DateTime.parse(pref.getString('ExerciseTime') ?? '');
      //print('No timestamp found');
    }
    notifyListeners();
  }

  Future<void> updateBaseGoal(int value) async {
    baseGoal = value == 0 ? 2000 : value;
    var pref = await SharedPreferences.getInstance();
    await pref.setInt('baseGoal', baseGoal!);
    notifyListeners();
  }
  Future<void> clearFoodExercise  () async {
    foodCalories = 0;
    exerciseCalories = 0;
    var pref = await SharedPreferences.getInstance();
    await pref.setInt('foodCalories', 0);
    await pref.setInt('exerciseCalories', 0);
    await pref.setInt('timestamp', DateTime.now().millisecondsSinceEpoch);
    notifyListeners();
  }

  Future<void> updateProfile({
    String? firstName,
    String? secondName,
    String? age,
    String? weight,
    String? height,
    String? gender,
    String? disease,
    String? fitnessGoal,
    String? activityLevel,
    String? workOutLevel,
  }) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (firstName != null && firstName.isNotEmpty) {
      await pref.setString('firstName', firstName);
    }

    if (secondName != null && secondName.isNotEmpty) {
      await pref.setString('secondName', secondName);
    }

    if (age != null && age.isNotEmpty) {
      await pref.setString('age', age);
    }

    if (weight != null && weight.isNotEmpty) {
      await pref.setString('weight', weight);
    }

    if (height != null && height.isNotEmpty) {
      await pref.setString('height', height);
    }

    if (gender != null && gender.isNotEmpty) {
      await pref.setString('gender', gender);
      print('Profile updated gender');
    }

    if (disease != null && disease.isNotEmpty) {
      await pref.setString('disease', disease);
    }

    if (fitnessGoal != null && fitnessGoal.isNotEmpty) {
      await pref.setString('fitness_goal', fitnessGoal);
    }

    if (activityLevel != null && activityLevel.isNotEmpty) {
      await pref.setString('activity_level', activityLevel);
    }

    if (workOutLevel != null && workOutLevel.isNotEmpty) {
      await pref.setString('workout_level', workOutLevel);
    }

    print('Profile updated');
     notifyListeners(); // Uncomment this line if you are using this in a ChangeNotifier class
  }

  void changePageIndex(int index, {required PageController pageController}) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    pageIndex = index;
    notifyListeners();
  }

  void screenSwapped(int index) {
    if (pageIndex != index) {
      pageIndex = index;
      notifyListeners();
    }
  }

  get getPageIndexValue => pageIndex;


}

//-----------------------------------------------------------------------
class ThemeController extends GetxController {
  late String currentTheme = 'Default';
  RxBool isDarkMode = false.obs;
  ThemeData get themeData =>
      Get.isDarkMode ? ThemeData.dark() : ThemeData.light();

  void toggleTheme() {
    isDarkMode.toggle();
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }

  void changeTheme(String theme) {
    Get.changeThemeMode(theme == "Dark" ? ThemeMode.dark : ThemeMode.light);
    currentTheme = theme;
    update();
  }
}
