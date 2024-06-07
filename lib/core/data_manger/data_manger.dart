import '../../pages/food/food_model/food_model.dart';

FoodPlanModel parseFoodPlan(String text) {
  final RegExp mealRegExp = RegExp(
      r'(Breakfast|Lunch|Dinner|Snack 1|Snack 2):\s*(.*)\s*\((\d+)\s*calories,\s*(\d+)g\s*protein,\s*(\d+)g\s*carbs\)');
  MealFactor? parseMealFactor(Match match) {
    return MealFactor(
      meal: match.group(2),
      calories: match.group(3),
      protein: match.group(4),
      carbs: match.group(5),
    );
  }

  final matches = mealRegExp.allMatches(text);
  MealFactor? breakfast, lunch, dinner, snack1, snack2;

  for (var match in matches) {
    switch (match.group(1)) {
      case 'Breakfast':
        breakfast = parseMealFactor(match);
        break;
      case 'Lunch':
        lunch = parseMealFactor(match);
        break;
      case 'Dinner':
        dinner = parseMealFactor(match);
        break;
      case 'Snack 1':
        snack1 = parseMealFactor(match);
        break;
      case 'Snack 2':
        snack2 = parseMealFactor(match);
        break;
    }
  }

  return FoodPlanModel(
    breakfast: breakfast,
    lunch: lunch,
    dinner: dinner,
    snack1: snack1,
    snack2: snack2,
  );
}
