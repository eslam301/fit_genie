import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeView extends StatelessWidget {

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    var height = MediaQuery.of(context).size.height;
    return  SingleChildScrollView(
      child: Column(
        children: [
          CarouselSlider(items: [
            Container(
                margin: const EdgeInsets.all(20),
                width: widthScreen * 0.95,

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
                      height: 150,
                      child: Row(
                          children: [
                            CircularPercentIndicator(radius: 70,
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
                            Spacer(),
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
                    )
                  ],
                )
            ),
            Container(
                margin: const EdgeInsets.all(20),
                width: widthScreen * 0.95,

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
                      height: 150,
                      child: Row(
                          children: [
                            CircularPercentIndicator(radius: 70,
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
                            Spacer(),
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
                    )
                  ],
                )
            ),
          ], options: CarouselOptions(
            viewportFraction: 1,
            height: height * 0.31,
            enableInfiniteScroll: false,
          )),

        ]
      ),
    );
  }
}
