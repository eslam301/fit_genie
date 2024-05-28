//https://127.0.0.1:8000/api/mealplan/


import 'package:http/http.dart' as http;

import '../food_model/food_model.dart';
// {
// "Breakfast": {
// "Calories": "450 Kcal",
// "Protein": "30 grams",
// "Carbs": "60 grams",
// "Meal": "Chicken Salad: 1 cup\nBanana: 1\nWhole-wheat toast: 2 slices"
// },
// "Lunch": {
// "Calories": "600 Kcal",
// "Protein": "45 grams",
// "Carbs": "80 grams",
// "Meal": "Brown rice with chicken stir-fry: 2 cups\nBroccoli: 1 cup"
// },
// "Dinner": {
// "Calories": "750 Kcal",
// "Protein": "50 grams",
// "Carbs": "100 grams",
// "Meal": "Grilled salmon with roasted potatoes: 4 ounces\nGreen beans: 1 cup"
// },
// "Snack 1": {
// "Calories": "200 Kcal",
// "Protein": "15 grams",
// "Carbs": "25 grams",
// "Meal": "Apple with peanut butter: 1 medium apple, 2 tablespoons peanut butter"
// },
// "Snack 2": {
// "Calories": "150 Kcal",
// "Protein": "10 grams",
// "Carbs": "20 grams",
// "Meal": "Trail mix: 1/4 cup"
// }
// }
class FoodApiManger {
  static Future<FoodPlanModel> fetchFoodData() async {
    // Uri uri = Uri.https(
    //     "127.0.0.1:8000/api/mealplan/",
    // );
    final response = {
      "Breakfast": {
        "Calories": "450 Kcal",
        "Protein": "30 grams",
        "Carbs": "60 grams",
        "Meal": "Chicken Salad: 1 cup\nBanana: 1\nWhole-wheat toast: 2 slices"
      },
      "Lunch": {
        "Calories": "600 Kcal",
        "Protein": "45 grams",
        "Carbs": "80 grams",
        "Meal": "Brown rice with chicken stir-fry: 2 cups\nBroccoli: 1 cup"
      },
      "Dinner": {
        "Calories": "750 Kcal",
        "Protein": "50 grams",
        "Carbs": "100 grams",
        "Meal": "Grilled salmon with roasted potatoes: 4 ounces\nGreen beans: 1 cup"
      },
      "Snack 1": {
        "Calories": "200 Kcal",
        "Protein": "15 grams",
        "Carbs": "25 grams",
        "Meal": "Apple with peanut butter: 1 medium apple, 2 tablespoons peanut butter"
      },
      "Snack 2": {
        "Calories": "150 Kcal",
        "Protein": "10 grams",
        "Carbs": "20 grams",
        "Meal": "Trail mix: 1/4 cup"
      }
    };
    return FoodPlanModel.fromJson(response);
    // final response = await http.get(uri);
    // if (response.statusCode == 200 && jsonDecode(response.body)['status'] == 'ok') {
    //   return FoodPlanModel.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to load Source');
    // }

  }
}