import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/pages/work_out_planes/widget/wide_container_widget.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_model/work_out_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_button.dart';

class WorkOutDetails extends StatelessWidget {
  final WorkOutTypes? exerciseModel;
  final String imageUrl;
  const WorkOutDetails({super.key, required this.exerciseModel, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    List<String?> titleSplit = exerciseModel?.typeOfExercises?.split(',') ?? [];
    List<String?> subtitleSplit = exerciseModel?.specificExercisesOrRoutines?.split(',') ?? [];
    final String? intensityLevel = exerciseModel?.intensityLevel;
    final String? caloriesBurnt = exerciseModel?.caloriesBurnt;
    final String? descriptionSplit = exerciseModel?.durationAndFrequencyOfWorkouts;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var theme = Theme.of(context);
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
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                cacheExtent: 1000,
                itemCount: titleSplit.length,
                itemBuilder: (context, index) {
                  return FadeInUp(
                      delay: Duration(milliseconds: 100 * (index + 1)),
                      duration: const Duration(milliseconds: 500),
                      child: WideContainer(
                        title: titleSplit[index] ?? '',
                        subtitle: subtitleSplit[index] ?? '' ,
                        description: descriptionSplit ?? '',
                        intensityLevel:intensityLevel?? '',
                        caloriesBurnt: caloriesBurnt?? '',
                      ).paddingSymmetric(vertical: 6));
                }),
          ),
          LongButton(
            label: 'Save',
            onTap: () {
              Get.snackbar(
                "Saved",
                "Workout plan was saved successfully",
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
}
