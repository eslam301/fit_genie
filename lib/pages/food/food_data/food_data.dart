class FoodData {
  static const List<Map<String, dynamic>> meal = [
    {
      "name": "Breakfast",
      "image": "assets/images/breakfast_image.jpg",
      "title": " Meal plan",
      "subtitle": "recommended",
    },
    {
      "name": "Snack1",
      "image": "assets/images/snacks1.jpg",
      "title": " Meal plan",
      "subtitle": "recommended",
    },
    {
      "name": "Snack2",
      "image": "assets/images/snacks2.jpg",
      "title": " Meal plan",
      "subtitle": "recommended",
    },
    {
      "name": "Lunch",
      "image": "assets/images/launch_image.png",
      "title": "Meal plan",
      "subtitle": "recommended",
    },
    {
      "name": "Dinner",
      "image": "assets/images/dinner_image.jpg",
      "title": " Meal plan",
      "subtitle": "recommended",
    }
  ];
  getDataMeal() {
    return meal;
  }
}
