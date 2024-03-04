import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/widgets/drop_down_bar.dart';
import '../model_viewer/model_test.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Icon(
              Icons.settings,
              color: Colors.white,
              size: 28,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Settings",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 28, color: Colors.white),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const DropDownBarTheme(),
        const SizedBox(
          height: 20,
        ),
        LongButton(label: 'My Model', onTap: (){
          Get.to(() => const ModelTestView(),transition: Transition.fadeIn);
        })
      ]),
    );
  }
}
