import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var width = MediaQuery.of(context).size.width;
    //var height = MediaQuery.of(context).size.height;
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
         CircularPercentIndicator(
          radius: width*0.14,
          lineWidth: 15.0,
          startAngle: 210.0,

          percent: 0.8,
          animation: true,
          animationDuration: 1000,
          circularStrokeCap: CircularStrokeCap.round,
          backgroundColor: Colors.grey,
           center: const Text("80%",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
          header: const Text("progress",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),),
          progressColor: theme.primaryColor,
        )
      ]
    );
  }
}
