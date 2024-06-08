import '../../pages/food/food_model/food_model.dart';
import '../../pages/work_out_planes/work_out_model/work_out_model.dart';

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

WorkOutPlansModel parseWorkoutData(String data) {
  List<String> sections = data.split(' + ');

  WorkOutTypes strengthTraining = WorkOutTypes(
    typeOfExercises: "Strength-training",
    durationAndFrequencyOfWorkouts:
        "Duration: 60 minutes & frequency-of-workouts: 4 times a week",
    intensityLevel: "Moderate to high",
    specificExercisesOrRoutines: _extractSpecificExercises(sections[0]),
    caloriesBurnt: _extractCalories(sections[0]),
    time: "60 minutes",
  );
  print('Parsed Strength Training: ${strengthTraining.toJson()}');

  WorkOutTypes cardio = WorkOutTypes(
    typeOfExercises: "Cardio",
    durationAndFrequencyOfWorkouts:
        "Duration: 60 minutes & frequency-of-workouts: 4 times a week",
    intensityLevel: "Moderate to high",
    specificExercisesOrRoutines: _extractSpecificExercises(sections[1]),
    caloriesBurnt: _extractCalories(sections[1]),
    time: _extractTime(sections[1]),
  );
  print('Parsed Cardio: ${cardio.toJson()}');

  WorkOutTypes flexibility = WorkOutTypes(
    typeOfExercises: "Flexibility",
    durationAndFrequencyOfWorkouts:
        "Duration: 60 minutes & frequency-of-workouts: 4 times a week",
    intensityLevel: "Moderate to high",
    specificExercisesOrRoutines: _extractSpecificExercises(sections[2]),
    caloriesBurnt: _extractCalories(sections[2]),
    time: _extractTime(sections[2]),
  );
  print('Parsed Flexibility: ${flexibility.toJson()}');

  return WorkOutPlansModel(
    strengthTraining: strengthTraining,
    cardio: cardio,
    flexibility: flexibility,
  );
}

String _extractCalories(String section) {
  RegExp regExp = RegExp(r'(\d+) calories');
  Iterable<Match> matches = regExp.allMatches(section);
  int totalCalories = matches
      .map((match) => int.parse(match.group(1)!))
      .reduce((a, b) => a + b);
  return '$totalCalories calories';
}

String _extractTime(String section) {
  RegExp regExp = RegExp(r'(\d+) minutes');
  Match? match = regExp.firstMatch(section);
  return match != null ? '${match.group(1)} minutes' : 'Unknown';
}

String _extractSpecificExercises(String section) {
  RegExp regExp = RegExp(
      r'(\w+ \(\d+ sets of \d+ reps\)|\d+ minutes of \w+|\d+ minutes of \w+ \(\d+ calories\))');
  Iterable<Match> matches = regExp.allMatches(section);
  return matches.map((match) => match.group(1)).join(' / ');
}
