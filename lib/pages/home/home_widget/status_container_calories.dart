import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class CaloriesContainer extends StatelessWidget {
  const CaloriesContainer({super.key});

  @override
  Widget build(BuildContext context) {
    // double radius = 50;
    double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    var theme = Theme.of(context);
    return Container(
        clipBehavior: Clip.hardEdge,
      // margin: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(20)
          ),
        ) ,
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Calories',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
            const Text('Remaining = Goal - food + Exercise',style: TextStyle(color: Colors.grey,fontSize: 10)),
            SizedBox(
              height: height*0.19,
              child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: height*0.092,
                      progressColor: theme.primaryColor,
                      backgroundColor: Colors.white,
                      percent: 0.6,
                      center: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('2,820',style: TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                          Text('Remaining',style: TextStyle(color: Colors.white,fontSize: 14),),
                        ],
                      ),
                      animation: true,
                      lineWidth: 10,
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                    const Spacer(),
                    const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(children: [
                            Icon(Icons.flag_rounded,size: 30,),
                            SizedBox(width: 10,),
                            Text('Base Goal\n2,820',style: TextStyle(color: Colors.white,fontSize: 14),),
                          ],),
                          Row(children: [
                            Icon(Icons.fastfood_rounded,size: 30,),
                            SizedBox(width: 10,),
                            Text('Food\n0',style: TextStyle(color: Colors.white,fontSize: 14),),
                          ],),
                          Row(children: [
                            Icon(Icons.local_fire_department_rounded,size: 30,),
                            SizedBox(width: 10,),
                            Text('Exercise\n0',style: TextStyle(color: Colors.white,fontSize: 14),),
                          ],)
                        ]
                    )
                  ]
              ),
            ),
          ],
        )
    );
  }
}
