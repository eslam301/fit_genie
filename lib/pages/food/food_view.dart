import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'food_api_manger/food_api_manger.dart';
import 'food_data/food_data.dart';
import 'food_details_view_layout/meal_plan_view.dart';
import 'food_model/food_model.dart';
import 'food_widget/buttons.dart';
//import 'package:flutter_application_1/button.dart';

class FoodPlanView extends StatefulWidget {
  const FoodPlanView({super.key});

  @override
  State<FoodPlanView> createState() => _FoodPlanViewState();
}

class _FoodPlanViewState extends State<FoodPlanView> {
  static const List<Map<String, dynamic>> meal = FoodData.meal;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.fastfood_outlined,
                color: Theme.of(context).colorScheme.secondary, size: 30),
            const SizedBox(width: 10),
            Text('Meal Plan', style: Theme.of(context).textTheme.titleLarge),
          ],
        ).paddingOnly(left: 20, top: 20),
        Expanded(
            child: FutureBuilder(
          future: FoodApiManger.fetchFoodData(),
          builder:
              (BuildContext context, AsyncSnapshot<FoodPlanModel> snapshot) {
            if (snapshot.hasData) {
              FoodPlanModel foodPlan = snapshot.data as FoodPlanModel;
              return ListView(
                children: [
                  Container(
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
                          meal[0]["image"].toString(),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: media.width,
                          height: media.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                meal[0]["title"],
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                meal[0]["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                meal[0]["subtitle"],
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
                                            appBarTitle: meal[0]["name"],
                                            body: MealPlanView(
                                              mealFactor:foodPlan.breakfast,
                                              index: 0,
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
                  ),
                  Container(
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
                          meal[1]["image"].toString(),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: media.width,
                          height: media.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                meal[1]["title"],
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                meal[1]["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                meal[1]["subtitle"],
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
                                            appBarTitle: meal[1]["name"],
                                            body: MealPlanView(
                                              mealFactor: foodPlan.snack1,
                                              index:1,
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
                  ),
                  Container(
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
                          meal[1]["image"].toString(),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: media.width,
                          height: media.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                meal[1]["title"],
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                meal[1]["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                meal[1]["subtitle"],
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
                                            appBarTitle: meal[1]["name"],
                                            body: MealPlanView(
                                              mealFactor: foodPlan.snack2,
                                              index: 1,
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
                  ),
                  Container(
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
                          meal[3]["image"].toString(),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: media.width,
                          height: media.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                meal[3]["title"],
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                meal[3]["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                meal[3]["subtitle"],
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
                                            appBarTitle: meal[3]["name"],
                                            body: MealPlanView(
                                              mealFactor: foodPlan.dinner,
                                              index: 3,
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
                  ),
                  Container(
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
                          meal[2]["image"].toString(),
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
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          width: media.width,
                          height: media.width * 0.5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                meal[2]["title"],
                                style: const TextStyle(
                                  color: Colors.yellow,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                meal[2]["name"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                meal[2]["subtitle"],
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
                                            appBarTitle: meal[2]["name"],
                                            body: MealPlanView(
                                              mealFactor: foodPlan.lunch,
                                              index: 2,
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
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )),
      ],
    );
  }
}
