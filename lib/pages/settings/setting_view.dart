import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import '../model_viewer/model_test.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  String selectedLanguage = "English";
  String selectedTheme = "Dark";
  List<DropdownMenuItem> languagesItems = [
    const DropdownMenuItem(
        value: "English",
        child: Text(
          "English",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        )),
    const DropdownMenuItem(
        value: "Arabic",
        child: Text(
          "Arabic",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        )
    ),
  ];
  List<DropdownMenuItem> themeItems = [
    const DropdownMenuItem(
        value: "Dark",
        child: Text(
          "Dark",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        )),
    const DropdownMenuItem(
        value: "Light",
        child: Text(
          "Light",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text(
        "Settings",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
      ),
      DropdownButton(
          items: languagesItems,
          value: selectedLanguage,
          onChanged: (value) {
            setState(() {
              selectedLanguage = value;
            });
          }),
      DropdownButton(
          items: themeItems,
          value: selectedTheme,
          onChanged: (value) {
            setState(() {
              selectedTheme = value;
            });
          }),
      LongButton(label: 'model', onTap: (){
        Get.to(() => const ModelTestView(),transition: Transition.fadeIn);
      })
    ]);
  }
}
