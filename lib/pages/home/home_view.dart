import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';
import '../../fire_base/firebase.dart';
import 'home_widget/Exercise/exercise_container.dart';
import 'home_widget/ads_container.dart';
import 'home_widget/status_container_calories.dart';
import 'home_widget/steps_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}


class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    // TODO: implement initState

    print('gettingData---------------------------------');
    getUserDataFromFireStoreByEmail(email: FirebaseAuth.instance.currentUser!.email ?? 'no email');
    print(
        'data got --------------${FirebaseAuth.instance.currentUser!.email}-------------------');
    super.initState();
    //ApplicationFirebaseAuth.getUserData();
  }
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppProvider>(context);

    var heightScreen = MediaQuery.of(context).size.height;
    return ListView(
        padding: const EdgeInsets.only(top: 20, bottom: 120),
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Row(
            children: [
              Icon(Icons.dashboard,
                  color: Theme.of(context).colorScheme.secondary, size: 30),
              const SizedBox(width: 10),
              Text('Dashboard', style: Theme.of(context).textTheme.titleLarge),
            ],
          ).paddingOnly(left: 20),
          CarouselSlider(
              items: [
                CaloriesContainer(provider: provider),
                // const HeartRateContainer(),
              ],
              options: CarouselOptions(
                pageSnapping: true,
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
                initialPage: 0,
                enableInfiniteScroll: false,
                reverse: false,
                autoPlay: false,
                autoPlayInterval: const Duration(seconds: 12),
                autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                autoPlayCurve: Curves.fastOutSlowIn,
                scrollPhysics: const BouncingScrollPhysics(),
                pauseAutoPlayOnTouch: true,
                viewportFraction: .9,
                height: heightScreen * 0.345,
              )),
          const SizedBox(
            height: 20,
          ),
          const AdsContainer(),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //steps
              StepsContainerView(provider: provider),
              //exercise
              const ExerciseContainer()
            ],
          ),
          // const Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     StepsContainerView(),
          //     StepsContainerView(),
          //   ],
          // ),
        ]);
  }
}
