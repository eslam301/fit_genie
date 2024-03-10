import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'home_widget/ads_container.dart';
import 'home_widget/Exercise/exercise_container.dart';
import 'home_widget/status_container_calories.dart';
import 'home_widget/steps_container.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    //var appTheme = ApplicationTheme();
    // var widthScreen = MediaQuery.of(context).size.width;
    var heightScreen = MediaQuery.of(context).size.height;
    return ListView(
      padding: const EdgeInsets.only( top: 20, bottom: 120),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
        children: [
      CarouselSlider(

          items: const [
            CaloriesContainer(),
            CaloriesContainer(),
          ],
          options: CarouselOptions(
            pageSnapping: true,
            aspectRatio: 16 / 9,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            initialPage: 0,
            enableInfiniteScroll: false,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 10),
            autoPlayAnimationDuration: const Duration(milliseconds: 1500),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollPhysics: const BouncingScrollPhysics(),
            pauseAutoPlayOnTouch: true,
            viewportFraction: .9,
            height: heightScreen * 0.345,
          )),
      const SizedBox(height: 20,),
      const AdsContainer(),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StepsContainerView(),
          ExerciseContainer(),
        ],
      ),
      const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StepsContainerView(),
          StepsContainerView(),
        ],
      ),
    ]);
  }
}
