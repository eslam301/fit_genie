import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/fire_base/firebase.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/provider/app_provider.dart';
import '../../../core/widgets/custom_drop_down/custom_drop_down_par.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/widgets/logo_splash_widget.dart';
import '../../../layout/home_layout.dart';
import '../../profile/profile_view.dart';

class RequiredForm extends StatefulWidget {
  static const String routeName = '/requiredForm';
  final bool isUpdate;
  final String? password;
  const RequiredForm({
    super.key,
    this.isUpdate = false,
    this.password,
  });

  @override
  State<RequiredForm> createState() => _RequiredFormState();
}
class _RequiredFormState extends State<RequiredForm> {
  final GlobalKey<FormState> submitFormKey = GlobalKey<FormState>();

  final TextEditingController firstNameController = TextEditingController();

  final TextEditingController secondNameController = TextEditingController();

  final TextEditingController weightController = TextEditingController();

  final TextEditingController heightController = TextEditingController();

  final TextEditingController allergiesController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  String? genderValue;
  String? activityLevel;
  String? workOutLevel;
  String? fitnessGoal;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return SingleChildScrollView(
        child: Form(
      key: submitFormKey,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 20, bottom: 220, top: 20),
        child: Column(children: [
          FadeInUp(
            duration: const Duration(milliseconds: 400),
            child: const LogoSplashWidget(),
          ),
          const SizedBox(height: 20),
          CustomTextField(
            controller: firstNameController,
            label: 'Name',
            suffixIcon: const Icon(Icons.person),
            keyboardType: TextInputType.name,
            delay: const Duration(milliseconds: 50),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              } else {
                //print('name is valid');
                return null;
              }
            },
          ),
          CustomTextField(
            controller: secondNameController,
            label: 'Second Name (optional)',
            suffixIcon: const Icon(Icons.person_3_outlined),
            keyboardType: TextInputType.name,
            delay: const Duration(milliseconds: 100),
            validator: (String? value) {
              return null;
            },
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 150),
              child: CustomDropDown(
                backColor: Theme.of(context).primaryColor.withOpacity(0.4),
                label: "Gender",
                value: genderValue,
                items: const ['Male', 'Female'],
                iconItems: const [Icons.male, Icons.female],
                onChanged: (String? value) {
                  setState(() {
                    genderValue = value ?? 'Gender';
                    print(genderValue);
                  });
                },
              )),
          FadeInUp(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 200),
              child: CustomDropDown(
                backColor: Theme.of(context).primaryColor.withOpacity(0.4),
                label: "Activity Level",
                value: activityLevel,
                items: const [
                  'Below Average',
                  'Average',
                  'Above Average',
                  'Highly Active'
                ],
                iconItems: const [
                  Icons.person_3_outlined,
                  Icons.directions_walk,
                  Icons.directions_run,
                  Icons.directions_bike
                ],
                onChanged: (String? value) {
                  setState(() {
                    activityLevel = value ?? 'Activity Level';
                  });
                },
              )),
          FadeInUp(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 250),
              child: CustomDropDown(
                backColor: Theme.of(context).primaryColor.withOpacity(0.4),
                label: "Workout Level",
                value: workOutLevel,
                items: const ['Intermediate', 'Beginner', 'Advanced'],
                iconItems: const [
                  Icons.directions_walk,
                  Icons.directions_run,
                  Icons.directions_bike
                ],
                onChanged: (String? value) {
                  setState(() {
                    workOutLevel = value ?? 'Workout Level';
                  });
                },
              )),
          FadeInUp(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 300),
              child: CustomDropDown(
                backColor: Theme.of(context).primaryColor.withOpacity(0.4),
                label: "Fitness Goal",
                value: fitnessGoal,
                items: const [
                  'Gain Weight',
                  'Healthy LifeStyle',
                  'Lose Weight',
                ],
                iconItems: const [
                  Icons.arrow_upward,
                  Icons.health_and_safety_outlined,
                  Icons.arrow_downward
                ],
                onChanged: (String? value) {
                  setState(() {
                    fitnessGoal = value ?? 'Fitness Goal';
                  });
                },
              )),
          CustomTextField(
            controller: weightController,
            label: 'Weight (kg)',
            suffixIcon: const Icon(Icons.monitor_weight),
            keyboardType: TextInputType.number,
            delay: const Duration(milliseconds: 350),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your weight';
              } else if (double.parse(value) > 300 ||
                  double.parse(value) < 30) {
                return 'Please enter a valid weight';
              } else {
                return null;
              }
            },
          ),
          CustomTextField(
            controller: heightController,
            suffixIcon: const Icon(Icons.height),
            label: 'Height (cm)',
            keyboardType: TextInputType.number,
            delay: const Duration(milliseconds: 400),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your height';
              } else if (double.parse(value) > 300 ||
                  double.parse(value) < 100) {
                return 'Please enter a valid height';
              }
              return null;
            },
          ),
          CustomTextField(
            controller: ageController,
            label: 'Age',
            keyboardType: TextInputType.number,
            suffixIcon: const Icon(Icons.calendar_month),
            delay: const Duration(milliseconds: 450),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your age';
              } else if (int.tryParse(value) == null) {
                return 'Please enter a valid age';
              } else {
                return null;
              }
            },
          ),
          CustomTextField(
            controller: allergiesController,
            label: 'Disease (optional)',
            suffixIcon: const Icon(Icons.health_and_safety),
            keyboardType: TextInputType.name,
            delay: const Duration(milliseconds: 500),
            validator: (String? value) {
              return null;
            },
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 550),
            child: LongButton(
                label: 'submit',
                onTap: () async {
                  if (widget.isUpdate == true) {
                    await updateUserDataToFireStore(
                      firstName: firstNameController.text,
                      secondName: secondNameController.text,
                      gender: genderValue ?? '',
                      weight: weightController.text,
                      height: heightController.text,
                      age: ageController.text,
                      allergies: allergiesController.text,
                      email: user?.email??'',
                      activityLevel: activityLevel ?? '',
                      workOutLevel: workOutLevel ?? '',
                      fitnessGoal: fitnessGoal ?? '',
                    );
                    await provider.updateProfile(
                      firstName: firstNameController.text,
                      secondName: secondNameController.text,
                      gender: genderValue ?? '',
                      weight: weightController.text,
                      height: heightController.text,
                      age: ageController.text,
                      disease: allergiesController.text,
                      activityLevel: activityLevel ?? '',
                      workOutLevel: workOutLevel ?? '',
                      fitnessGoal: fitnessGoal ?? '',
                    );
                    Get.back();
                  } else {
                    createUserDataToFireStore(
                      firstName: firstNameController.text,
                      secondName: secondNameController.text,
                      gender: genderValue!,
                      weight: weightController.text,
                      height: heightController.text,
                      age: ageController.text,
                      allergies: allergiesController.text,
                      activityLevel: activityLevel!,
                      workOutLevel: workOutLevel!,
                      fitnessGoal: fitnessGoal!,
                      password: widget.password!,
                    );
                    print('profile created');
                    submit();
                  }
                }),
          )
        ]),
      ),
    ));
  }

  Future<void> submit() async {
    if (submitFormKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('firstName', firstNameController.text);
      await prefs.setString('secondName', secondNameController.text);
      await prefs.setString('gender', genderValue!);
      await prefs.setString('weight', weightController.text);
      await prefs.setString('height', heightController.text);
      await prefs.setString('age', ageController.text);
      await prefs.setString('disease', allergiesController.text);
      await prefs.setString('activity_level', activityLevel!);
      await prefs.setString('workout_level', workOutLevel!);
      await prefs.setString('fitness_goal', fitnessGoal!);
      Get.snackbar('Success', 'Your profile has been created successfully');
      Get.offAll(() => const HomeLayout());
    }
  }
}
