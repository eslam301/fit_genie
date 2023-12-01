import 'package:flutter/material.dart';

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
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        )),
    const DropdownMenuItem(
        value: "Arabic",
        child: Text(
          "Arabic",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        )),
  ];
  List<DropdownMenuItem> themeItems = [
    const DropdownMenuItem(
        value: "Dark",
        child: Text(
          "Dark",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        )),
    const DropdownMenuItem(
        value: "Light",
        child: Text(
          "Light",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      const Text(
        "Settings",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 30, color: Colors.black),
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
    ]);
  }
}
