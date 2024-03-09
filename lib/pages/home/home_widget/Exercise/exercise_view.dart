import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Exercise',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(width: 10,),
                const Icon(Icons.sports_gymnastics,color: Colors.amber,),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.cancel_outlined,
                      color: Colors.red,
                      size: 30,
                    ))
              ],
            ),
          ],
        ));
  }
}
