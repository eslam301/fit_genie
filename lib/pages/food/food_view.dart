import 'package:flutter/material.dart';

class FoodPlanView extends StatelessWidget {
  const FoodPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: const Text('Food Plan',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
          )
        ]
      )
    );
  }
}
