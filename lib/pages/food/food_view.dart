import 'package:flutter/material.dart';
import 'food_widget/buttons.dart';
//import 'package:flutter_application_1/button.dart';

class FoodPlanView extends StatefulWidget {
  const FoodPlanView({super.key});

  @override
  State<FoodPlanView> createState() => _FoodPlanViewState();
}

class _FoodPlanViewState extends State<FoodPlanView> {
  static final List meal = [
    {
      "name": "Breakfast",
      "Image": "assets/images/breakfast_image.jpg",
      "title": "Meal plan",
      "subtitle": "",
    },
    {
      "name": "Snack",
      "Image": "assets/images/dinner_image.jpg",
      "title": "Meal plan",
      "subtitle": "",
    },
    {
      "name": "Dinner",
      "Image": "assets/images/snacks_image.jpg",
      "title": "Meal plan",
      "subtitle": "",
    },
    {
      "name": "Lunch",
      "Image": "assets/images/launch_image.png",
      "title": "Meal plan",
      "subtitle": "",
    }
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return
         ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 130),
            itemCount: meal.length,
            itemBuilder: (context, index) {
              var mealData = meal[index] as Map? ?? {};
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Image.asset(
                      mealData["Image"].toString(),
                      width: media.width,
                      height: media.width * 0.5,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: media.width,
                      height: media.width * 0.5,
                      decoration: BoxDecoration(
                        color: index % 2 == 0
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
                            mealData["title"],
                            style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            mealData["name"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            mealData["subtitle"],
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
                                  onPressed: () {},
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
            });
  }
}
