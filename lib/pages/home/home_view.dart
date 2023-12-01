import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         CircularPercentIndicator(
          radius: 60.0,
          lineWidth: 22.0,
          percent: 0.8,
          animation: true,
          animationDuration: 1000,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey,
           center: const Text("80%"),
          header: const Text("progress",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.black),),
          progressColor: Colors.green,
        )
      ]
    );
  }
}
