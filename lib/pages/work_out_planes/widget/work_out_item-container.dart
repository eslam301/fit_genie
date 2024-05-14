import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../work_out_details_page_view.dart';
import '../work_out_model/work_out_model.dart';

class WorkOutWidgetItem extends StatelessWidget {
  final WorkOutPlansModel exerciseModel;
  final WorkOutTypes? exerciseModel1;

  const WorkOutWidgetItem(
      {super.key, required this.exerciseModel, this.exerciseModel1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(
                image: AssetImage('assets/images/cardio.png'),
                filterQuality: FilterQuality.high,
              )),
          const SizedBox(height: 10),
          Text(
            '${exerciseModel1?.typeOfExercises}',
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
          Text(
            '${exerciseModel1?.specificExercisesOrRoutines}',
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            '${exerciseModel1?.durationAndFrequencyOfWorkouts}',
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.grey, fontSize: 15),
          ),
          const SizedBox(height: 10),
          LongButton(
              label: 'View Details',
              onTap: () {
                Get.to(LayOutPageView(
                  appBarTitle: 'Cardio',
                  body: WorkOutDetails(
                    exerciseModel: exerciseModel1,
                  ),
                ));
              }),
        ],
      ),
    );
  }
}
