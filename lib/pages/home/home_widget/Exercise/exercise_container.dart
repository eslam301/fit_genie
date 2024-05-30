import 'package:fitgenie/core/health/health_data_model_calories.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_plan_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/provider/app_provider.dart';

class ExerciseContainer extends StatelessWidget {
  final HealthDataModelCalories? healthDataModel;
  const ExerciseContainer({super.key, this.healthDataModel});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    String calories = provider.exerciseCalories.toString();
    DateFormat dateFormat = DateFormat('HH:mm');
    String formattedDate = dateFormat.format(provider.exerciseTime);
    // int? calories = healthDataModel?.caloriesExpended?[0].value ?? 0;
    return Container(
        width: 180,
        height: 140,
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text(
                    'Exercise',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        openExercise(context);
                      },
                      icon: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ))
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.local_fire_department_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '$calories Calories',
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    formattedDate,
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ]));
  }

  void openExercise(BuildContext context) {
    showModalBottomSheet(
        enableDrag: true,
        isScrollControlled: true,
        useSafeArea: true,
        showDragHandle: true,
        context: context,
        builder: (context) => const WorkOutPlanView());
        // builder: (context) => const ExerciseView());
  }
}
