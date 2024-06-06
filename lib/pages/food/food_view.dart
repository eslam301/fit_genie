import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'food_api_manger/food_api_manger.dart';
import 'food_model/food_model.dart';
import 'food_widget/food_widget_container.dart';

class FoodPlanView extends StatefulWidget {
  static const routeName = '/food_plan_view';
  const FoodPlanView({super.key});

  @override
  State<FoodPlanView> createState() => _FoodPlanViewState();
}

class _FoodPlanViewState extends State<FoodPlanView> {
  @override
  Widget build(BuildContext context) {
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
          future: FoodApiManger.fetchFoodData(email: 'mhd@gmail.com'),
          builder:
              (BuildContext context, AsyncSnapshot<FoodPlanModel> snapshot) {
            if (snapshot.hasData) {
              FoodPlanModel foodPlan = snapshot.data as FoodPlanModel;
              return ListView(
                padding: const EdgeInsets.only(top: 5,bottom: 190),
                physics: const BouncingScrollPhysics(),
                children: [
                  FoodContainerWidget(
                    index: 0,
                    mealFactor: foodPlan.breakfast,
                  ),
                  FoodContainerWidget(
                    index: 1,
                    mealFactor: foodPlan.snack1,
                  ),
                  FoodContainerWidget(
                    index: 2,
                    mealFactor: foodPlan.snack2,
                  ),
                  FoodContainerWidget(
                    index: 3,
                    mealFactor: foodPlan.lunch,
                  ),
                  FoodContainerWidget(
                    index: 4,
                    mealFactor: foodPlan.dinner,
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Column(
                children: [
                  Text('${snapshot.error}'),
                  const SizedBox(height: 10),
                  CustomTextField(
                      controller: TextEditingController(), label: 'email'),
                  ElevatedButton(
                      onPressed: () {
                        print('----------------------');
                        setState(() {
                          FoodApiManger.fetchFoodData(
                              email: TextEditingController().text);
                        });
                      },
                      child: const Text('Try Again'))
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        )),
      ],
    );
  }
}
