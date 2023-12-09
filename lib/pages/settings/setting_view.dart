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
  List <String> languages = [
    'English',
    'Arabic',
  ];
  List <String> themes = [
    'Light',
    'Dark',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Text(
          "Settings",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        const SizedBox(
          height: 20,
        ),
        DropDownBar(listOfSheet: languages,title: "languages",),
        DropDownBar(listOfSheet: themes,title: "themes",),
        LongButton(label: 'Model', onTap: (){
          Get.to(() => const ModelTestView(),transition: Transition.fadeIn);
        })
      ]),
    );
  }
}
