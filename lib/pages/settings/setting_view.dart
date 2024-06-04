// import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/layout/basic_layout_page.dart';
import 'package:fitgenie/pages/sign-in/sign_up/required_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
import '../../core/widgets/drop_down_bar.dart';
// import '../model_viewer/model_test.dart';

class SettingsView extends StatefulWidget {
  static const String routeName = '/settings';
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.settings,
              color: theme.colorScheme.secondary,
              size: 28,

            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Settings",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.white),
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
        LongButton(label: 'update profile', onTap: () {
          Get.to(
            const LayOutPageView(appBarTitle:'Update Profile', body: RequiredForm(
              isUpdate: true,
            ))
          );
        }),
        // LongButton(
        //     label: 'My Model',
        //     onTap: () {
        //       Get.to(() => const ModelTestView(),
        //           transition: Transition.fadeIn);
        //     })
      ]),
    );
  }
}
