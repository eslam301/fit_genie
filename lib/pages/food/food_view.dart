import 'package:flutter/material.dart';
import 'food_widget/buttons.dart';
//import 'package:flutter_application_1/button.dart';

class FoodPlanView extends StatefulWidget {
  const FoodPlanView({super.key});

  @override
  State<FoodPlanView> createState() => _FoodPlanViewState();
}

class _FoodPlanViewState extends State<FoodPlanView> {
  List meal = [
    {
      "name": "Breakfast",
      "Image": "assets/images/Healthy-Breakfast-1000x620.jpg",
      "title": "Meal plan",
      "subtitle": "",
    },
    {
      "name": "Snack",
      "Image":
          "assets/images/healthy-tuna-pasta-bake-p46-151271-2.jpg",
      "title": "Meal plan",
      "subtitle": "",
    },
    {
      "name": "Dinner",
      "Image": "assets/images/variety-of-healthy-snacks-gourmet-dips-royalty-free-image-1639694989.jpg",
      "title": "Meal plan",
      "subtitle": "",
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return
         ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            itemCount: meal.length,
            itemBuilder: (context, index) {
              var W0bg = meal[index] as Map? ?? {};
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Image.asset(
                      W0bg["Image"].toString(),
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
                            W0bg["title"],
                            style: const TextStyle(
                              color: Colors.yellow,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            W0bg["name"],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            W0bg["subtitle"],
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
