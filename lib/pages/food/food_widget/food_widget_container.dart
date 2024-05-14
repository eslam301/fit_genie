import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../layout/basic_layout_page.dart';
import '../food_data/food_data.dart';
import '../food_details_view_layout/meal_plan_view.dart';
import '../food_model/food_model.dart';
import 'buttons.dart';

class FoodContainerWidget extends StatelessWidget {
  final int index;
  final MealFactor? mealFactor;
  const FoodContainerWidget({super.key,required this.index, required this.mealFactor});
  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> meal = FoodData.meal;
    var media = MediaQuery.of(context).size;
    return Container(
      width: media.width,
      height: media.width * 0.5,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.all(14),
      child: Stack(
        children: [
          Image.asset(
            meal[index]["image"],
            width: media.width,
            height: media.width * 0.5,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.width * 0.5,
            decoration: BoxDecoration(
              color: 1 % 2 == 0
                  ? Colors.black.withOpacity(0.7)
                  : Colors.black.withOpacity(0.55),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            width: media.width,
            height: media.width * 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  meal[index]["title"],
                  style: const TextStyle(
                    color: Colors.yellow,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  meal[index]["name"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  meal[index]["subtitle"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 90,
                      height: 45,
                      child: RoundButton(
                        title: "View",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        onPressed: () {
                          Get.to(
                            () => LayOutPageView(
                              appBarTitle: meal[index]["name"],
                              body: MealPlanView(
                                mealFactor: mealFactor,
                                index: index,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
