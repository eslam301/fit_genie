import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../fire_base/firebase.dart';
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
  late final User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = ApplicationFirebaseAuth.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    print('----------------------');
    print('email: ${user?.email ?? 'no email'}');
    print('----------------------');
    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        setState(() {});
      },
      child: Column(
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
            future: FoodApiManagerFirebase.fetchFoodData(email: '${user!.email}'),
            builder:
                (BuildContext context, AsyncSnapshot<FoodPlanModel> snapshot) {
              if (snapshot.hasData) {
                FoodPlanModel foodPlan = snapshot.data as FoodPlanModel;

                return ListView(
                  padding: const EdgeInsets.only(top: 5, bottom: 190),
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
                    ElevatedButton(
                        onPressed: () async {
                          print('----------------------');
                          setState(() {});
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
      ),
    );
  }
}
