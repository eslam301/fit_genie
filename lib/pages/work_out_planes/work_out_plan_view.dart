import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/pages/work_out_planes/widget/work_out_item-container.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_api.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_model/work_out_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../fire_base/firebase.dart';

class WorkOutPlanView extends StatefulWidget {
  static const routeName = '/work_out_plan_view';
  const WorkOutPlanView({super.key});

  @override
  State<WorkOutPlanView> createState() => _WorkOutPlanViewState();
}

class _WorkOutPlanViewState extends State<WorkOutPlanView> {
  late final User? user;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = ApplicationFirebaseAuth.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        children: [
          Icon(Icons.fitness_center_sharp, color: theme.colorScheme.secondary),
          const SizedBox(width: 10),
          Text(
            'WorkOut Plan',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
        ],
      ).paddingOnly(top: 20, left: 20),
      const SizedBox(height: 20),
      Expanded(
          child: FutureBuilder(
        future:
            WorkOutAPIMangerFirebase.fetchWorkOutData(email: "${user!.email}"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${snapshot.error}", style: const TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.wifi_off,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () {
                    setState(() {
                    });
                  },
                  icon: const Icon(Icons.refresh_sharp),
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Loading...', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ]));
          } else if (snapshot.hasData) {
            print('email ${user?.email}');
            print('snapshot.data ${snapshot.data}');
            WorkOutPlansModel workOutModel = snapshot.data as WorkOutPlansModel;
            return ListView(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 210, left: 16, right: 16),
              children: [
                WorkOutWidgetItem(
                  exerciseModel: workOutModel,
                  imageUrl: 'assets/images/cardio.jpg',
                  title: 'Cardio',
                  exerciseModel1: workOutModel.cardio,
                ).paddingOnly(bottom: 10),
                WorkOutWidgetItem(
                  exerciseModel: workOutModel,
                  imageUrl: 'assets/images/strength_Training.jpg',
                  title: 'Strength Training',
                  exerciseModel1: workOutModel.strengthTraining,
                ).paddingOnly(bottom: 10),
                WorkOutWidgetItem(
                  exerciseModel: workOutModel,
                  imageUrl: 'assets/images/flexibility.png',
                  title: 'Flexibility',
                  exerciseModel1: workOutModel.flexibility,
                ).paddingOnly(bottom: 10),
              ],
            );
          } else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      ))
    ]);
  }
}
