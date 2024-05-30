import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AppProvider extends ChangeNotifier {
  int? steps;
  int? exerciseCalories;
  int foodCalories = 0;
  int? exerciseTime;
  int? baseGoal;
  int? heartRate;
  int? activeCalories;
  int? time;
  int pageIndex = 0;

  Future<void> changeExerciseCalories(int value) async {
    exerciseCalories = value;
    var pref = await SharedPreferences.getInstance();
    await pref.setInt('exerciseCalories', exerciseCalories!);
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
      } else {
        exerciseCalories = pref.getInt('exerciseCalories');
        foodCalories = pref.getInt('foodCalories') ?? 0;
        baseGoal = pref.getInt('baseGoal');
        print('Last timestamp: $lastTimestamp');
      }
    } else {
      exerciseCalories = pref.getInt('exerciseCalories');
      foodCalories = pref.getInt('foodCalories') ?? 0;
      baseGoal = pref.getInt('baseGoal');
      print('No timestamp found');
    }
    notifyListeners();
  }





  void changePageIndex(int index, {required PageController pageController}) {
    pageController.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
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