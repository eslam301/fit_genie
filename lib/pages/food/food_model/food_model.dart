class FoodPlanModel {
  MealFactor? breakfast;
  MealFactor? lunch;
  MealFactor? dinner;
  MealFactor? snack1;
  MealFactor? snack2;

  FoodPlanModel(
      {this.breakfast, this.lunch, this.dinner, this.snack1, this.snack2});

  FoodPlanModel.fromJson(Map<String, dynamic> json) {
    breakfast = json['Breakfast'] != null
        ? MealFactor.fromJson(json['Breakfast'])
        : null;
    lunch =
    json['Lunch'] != null ? MealFactor.fromJson(json['Lunch']) : null;
    dinner =
    json['Dinner'] != null ? MealFactor.fromJson(json['Dinner']) : null;
    snack1 = json['Snack 1'] != null
        ? MealFactor.fromJson(json['Snack 1'])
        : null;
    snack2 = json['Snack 2'] != null
        ? MealFactor.fromJson(json['Snack 2'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (breakfast != null) {
      data['Breakfast'] = breakfast!.toJson();
    }
    if (lunch != null) {
      data['Lunch'] = lunch!.toJson();
    }
    if (dinner != null) {
      data['Dinner'] = dinner!.toJson();
    }
    if (snack1 != null) {
      data['Snack 1'] = snack1!.toJson();
    }
    if (snack2 != null) {
      data['Snack 2'] = snack2!.toJson();
    }
    return data;
  }
}

class MealFactor {
  String? calories;
  String? protein;
  String? carbs;
  String? meal;

  MealFactor({this.calories, this.protein, this.carbs, this.meal});

  MealFactor.fromJson(Map<String, dynamic> json) {
    calories = json['Calories'];
    protein = json['Protein'];
    carbs = json['Carbs'];
    meal = json['Meal'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Calories'] = calories;
    data['Protein'] = protein;
    data['Carbs'] = carbs;
    data['Meal'] = meal;
    return data;
  }
}
