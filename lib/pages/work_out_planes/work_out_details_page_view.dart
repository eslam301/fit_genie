import 'package:fitgenie/pages/work_out_planes/widget/wide_container_widget.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_model/work_out_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../core/provider/app_provider.dart';
import '../../core/widgets/custom_button.dart';

class WorkOutDetails extends StatelessWidget {
  final WorkOutTypes? exerciseModel;
  final String imageUrl;
  const WorkOutDetails({super.key, required this.exerciseModel, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    final String? title = exerciseModel?.typeOfExercises;
    final String? subtitle = exerciseModel?.specificExercisesOrRoutines;
    final String? intensityLevel = exerciseModel?.intensityLevel;
    final String? caloriesBurnt = exerciseModel?.caloriesBurnt;
    final String? descriptionSplitDuration = exerciseModel?.durationAndFrequencyOfWorkouts;
    final String? time = exerciseModel?.time;

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
    print('--------------------------tt----------------------------');
    print('title is $title');
    print('subtitle is $subtitle');
    print('intensityLevel is $intensityLevel');
    print('caloriesBurnt is $caloriesBurnt');
    print('descriptionSplitDuration is $descriptionSplitDuration');
    return Container(
      height: height*0.81,
      width: width,
      margin: const EdgeInsets.all(20),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: theme.primaryColor.withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 20),
          WideContainer(
            title: title,
            subtitle: subtitle,
            description: descriptionSplitDuration ?? '',
            intensityLevel: intensityLevel ?? ' ',
            caloriesBurnt: caloriesBurnt ?? '',
            time: time ?? '',
          ).paddingSymmetric(vertical: 6),
          LongButton(
            label: 'Save',
            onTap: () async {
              print('--------------------------tt----------------------------');
              print('time is $time');
              print('caloriesBurnt is $caloriesBurnt');
              int nCalories = extractCalories(caloriesBurnt!);
              int nTime = extractTime(time!);
              await provider.addExerciseCalories(
                  value: nCalories, time: nTime.toString());

              Get.snackbar(
                "Saved",
                "you have Burnt $nCalories calories",
                snackPosition: SnackPosition.TOP,
                padding: const EdgeInsets.all(20),
                overlayColor: Colors.black.withOpacity(0.5),
                margin: const EdgeInsets.all(20),
                backgroundColor: theme.primaryColor.withOpacity(0.8),
                colorText: Colors.white,
                duration: const Duration(milliseconds: 1500),
              );
            },
            color: theme.colorScheme.secondary.withOpacity(0.4),
          ).paddingAll(8),
        ],
      ),
    );
  }

  int extractTime(String timeString) {
    RegExp regExp = RegExp(r'(\d+) minutes');
    Match? match = regExp.firstMatch(timeString);
    return match != null ? int.parse(match.group(1)!) : 0;
  }

  int extractCalories(String calorieString) {
    RegExp regExp = RegExp(r'(\d+) calories');
    Match? match = regExp.firstMatch(calorieString);
    return match != null ? int.parse(match.group(1)!) : 0;
  }
}
