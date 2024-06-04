import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/provider/app_provider.dart';

class CaloriesContainer extends StatefulWidget {
  final AppProvider provider;
  const CaloriesContainer({super.key, required this.provider});

  @override
  State<CaloriesContainer> createState() => _CaloriesContainerState();
}

class _CaloriesContainerState extends State<CaloriesContainer> {
  @override
  void initState() {
    super.initState();
    widget.provider.updateDataDashboard();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int baseGoal = widget.provider.baseGoal ?? 2000;
    int food = widget.provider.foodCalories;
    int exerciseCal = widget.provider.exerciseCalories;
    int remaining = baseGoal - food + exerciseCal;
    double percent = remaining / baseGoal;
    int netCalories = food - exerciseCal;
    print(percent);
    percent = percent > 1 ? percent -1 : percent -1;
    int percentage = (percent * 100).round().obs();
    print(percent.obs);
    double height = MediaQuery.of(context).size.height;

    var theme = Theme.of(context);
    Color foodColor = theme.primaryColor;
    Color exerciseColor = Colors.orange.shade700;
    Color backgroundColor = Colors.white60;
    return GestureDetector(
      onTap: () {
        var foodController = TextEditingController();
        var exerciseController = TextEditingController();
        var baseGoalController = TextEditingController();
        showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          useSafeArea: true,
          showDragHandle: true,
          context: context,
          builder: (context) => Container(
            height: height * 0.6,
            padding: const EdgeInsets.all(16),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const Text(
                  'Enter Calories Goal',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextField(
                  keyBoardType: TextInputType.number,
                  delay: const Duration(milliseconds: 50),
                  controller: baseGoalController,
                  label: 'Base Goal',
                ),
                CustomTextField(
                  keyBoardType: TextInputType.number,
                  delay: const Duration(milliseconds: 100),
                  controller: foodController,
                  label: 'Food',
                ),
                CustomTextField(
                  keyBoardType: TextInputType.number,
                  delay: const Duration(milliseconds: 150),
                  controller: exerciseController,
                  label: 'Exercise',
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 400),
                  delay: const Duration(milliseconds: 200),
                  child: LongButton(label: 'Update', onTap: () {
                    widget.provider.updateBaseGoal(int.parse(baseGoalController.text.isEmpty ? '0' : baseGoalController.text));
                    widget.provider.addFoodCalories(int.parse(foodController.text.isEmpty ? '0' : foodController.text));
                    widget.provider.addExerciseCalories(value: int.parse(exerciseController.text.isEmpty ? '0' : exerciseController.text));
                    Navigator.pop(context);
                  }),
                ),

                FadeInUp(
                  duration: const Duration(milliseconds: 400),
                  delay: const Duration(milliseconds: 250),
                  child: LongButton(label: 'Cancel', onTap: () {
                    Navigator.pop(context);
                  }),
                ).paddingSymmetric(vertical: 20),
                FadeInUp(
                  duration: const Duration(milliseconds: 400),
                  delay: const Duration(milliseconds: 250),
                  child: LongButton(label: 'Clear', onTap: () {
                    widget.provider.clearFoodExercise();
                    Navigator.pop(context);
                  }),
                )
              ],
            ),
          ),
        );
      },
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Calories',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Net Calories = $netCalories',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const Text(
              'Remaining = Goal - Food + Exercise',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            SizedBox(
              height: height * 0.19,
              child: Row(
                children: [
                  CircularPercentIndicator(
                    startAngle: 0.0,
                    animateFromLastPercent: true,
                    animationDuration: 1000,
                    radius: height * 0.09,
                    progressColor: netCalories < 0 ? exerciseColor : foodColor,
                    backgroundColor: backgroundColor,
                    percent: percent.abs() >1 ? 1 : percent.abs() < 0 ? 0 : percent.abs(),
                    center: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${remaining.toInt()}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Remaining \n ${percentage.abs()}%',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    animation: true,
                    lineWidth: 10,
                    circularStrokeCap: CircularStrokeCap.butt,
                  ),
                  const Spacer(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildInfoRow(
                        icon: Icons.flag_rounded,
                        label: 'Base Goal',
                        value: baseGoal.toInt(),
                        color: Colors.white,
                      ),
                      _buildInfoRow(
                        icon: Icons.fastfood_rounded,
                        label: 'Food',
                        value: food.toInt(),
                        color: Colors.white,
                      ),
                      _buildInfoRow(
                        icon: Icons.local_fire_department_rounded,
                        label: 'Exercise',
                        value: exerciseCal.toInt(),
                        color: Colors.orange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required int value,
    required Color color,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 30,
          color: color,
        ),
        const SizedBox(width: 10),
        Text(
          '$label\n$value',
          style: TextStyle(
            color: color,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
