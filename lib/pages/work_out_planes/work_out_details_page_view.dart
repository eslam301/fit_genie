import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/pages/work_out_planes/widget/wide_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_button.dart';
import 'data/work_out_data.dart';

class WorkOutDetails extends StatelessWidget {
  const WorkOutDetails({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> workData = WorkData.getWorkOutData();
    var theme = Theme.of(context);
    return Container(
      height: double.infinity,
      width: double.infinity,
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
          const Image(image: AssetImage('assets/images/cardio.png')),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                physics: const BouncingScrollPhysics(),
                cacheExtent: 1000,
                itemCount: workData.length,
                itemBuilder: (context, index) {
                  return FadeInUp(
                      delay: Duration(milliseconds: 100 * (index + 1)),
                      duration: const Duration(milliseconds: 500),
                      child: WideContainer(
                        title: workData[index]["title"],
                        subtitle: workData[index]["subtitle"],
                        description: workData[index]["description"],
                      ).paddingSymmetric(vertical: 6));
                }),
          ),
          LongButton(
            label: 'Save',
            onTap: () {
              Get.snackbar(
                "Saved",
                "Meal saved successfully",
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
