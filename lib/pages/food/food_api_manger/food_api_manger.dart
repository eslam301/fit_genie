//https://127.0.0.1:8000/api/mealplan/

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/data_manger/data_manger.dart';
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
// class FoodApiManger {
//   static Future<FoodPlanModel> fetchFoodData({required String email}) async {
//     Uri uri = Uri.https(
//       "https://127.0.0.1:8000/api/mealplan/",
//     );
//
//     final body = jsonEncode({'email': email});
//
//     final response = await http.post(uri, body: body);
//     print('---------------response body----------------------');
//     print(response.toString());
//     print('---------------response body----------------------');
//     if (response.statusCode == 200 &&
//         jsonDecode(response.body)['status'] == 'ok') {
//       return FoodPlanModel.fromJson(jsonDecode(response.body));
//     } else if (response.statusCode == 200 &&
//         jsonDecode(response.body)['status'] == 'error') {
//       throw Exception(jsonDecode(response.body)['message']);
//     } else {
//       throw Exception('Failed to load Source');
//     }
//   }
// }

class FoodApiManagerFirebase {
  static Future<FoodPlanModel> fetchFoodData({required String email}) async {
    print('fetching data food plan');
    CollectionReference usersData =
        FirebaseFirestore.instance.collection('meal_plans');

    try {
      QuerySnapshot querySnapshot =
          await usersData.where('user', isEqualTo: email).get();

      if (querySnapshot.docs.isNotEmpty) {
        // Fetch the first document in the snapshot
        var userData = querySnapshot.docs.first['data'];
        print('-------------------------------------------------------------');
        print('userData: $userData');
        print('-------------------------------------------------------------');
        FoodPlanModel parsedData = parseFoodPlan(userData);
        print('-------------------------------------------------------------');
        print('parsed data: $parsedData');
        print('-------------------------------------------------------------');
        return parsedData;
      } else {
        print('User data not found');
        return FoodPlanModel();
      }
    } catch (e) {
      print('Error fetching user data: $e');
      return FoodPlanModel();
    }
  }
}
