import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../food_data/food_data.dart';
import '../food_model/food_model.dart';
import '../food_widget/food_details_wiget_view.dart';

class MealPlanView extends StatelessWidget {
  final int index;
  final MealFactor? mealFactor;
  const MealPlanView({super.key, required this.index, required this.mealFactor});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    String title = FoodData.meal[index]["name"].toString();
    String image = FoodData.meal[index]["image"].toString();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List listMeal = mealFactor?.meal?.split('\n') ?? [];
    return Container(
      clipBehavior: Clip.antiAlias,
      width: width,
      height: height * 0.81,
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(14),
      child: Column(children: [
        Image.asset(image),
        const SizedBox(height: 20),
        Text("for the $title",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            )),
        Expanded(
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: listMeal.length,
              itemBuilder: (context, index) {
                return FadeInUp(
                  animate: true,
                  duration: const Duration(milliseconds: 500),
                  delay: Duration(milliseconds: 150*(index+1)),
                  child: FoodCheckWidgetView(
                    listMeal: listMeal,
                    index: index,
                  ),
                );
              }),
        ),
        FadeIn(
          animate: true,
          duration: const Duration(milliseconds: 500),
          delay: const Duration(milliseconds: 1500),
          child: Container(
            width: width,
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.3),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Calories: \t ${mealFactor?.calories}',
                ),
                Text(
                  'Protein: \t ${mealFactor?.protein}',
                ),Text(
                  'Carbs: \t ${mealFactor?.carbs}',
                )
              ],
            ),
          ),
        ),
        LongButton(
          label: 'Save',
          onTap: () {
            Get.snackbar(
              "Saved",
              "Meal saved successfully",
              snackPosition: SnackPosition.TOP,
              padding: const EdgeInsets.all(20),
              overlayColor: Colors.black.withOpacity(0.5),
              margin: const EdgeInsets.all(20),
              backgroundColor: theme.primaryColor.withOpacity(0.8),
              colorText: Colors.white,
              duration: const Duration(milliseconds: 1500),
            );
          },
          color: theme.colorScheme.secondary.withOpacity(0.4),
        ).paddingAll(8),
      ]),
    );
  }
}
