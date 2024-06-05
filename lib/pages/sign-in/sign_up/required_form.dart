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
  const RequiredForm({
    super.key,
    this.isUpdate = false,
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

  final TextEditingController diseaseController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  String? genderValue;

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppProvider>(context);
    return SingleChildScrollView(
        child: Form(
      key: submitFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                  });
                },
              )),
          CustomTextField(
            controller: weightController,
            label: 'Weight (kg)',
            suffixIcon: const Icon(Icons.monitor_weight),
            keyboardType: TextInputType.number,
            delay: const Duration(milliseconds: 200),
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
            delay: const Duration(milliseconds: 250),
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
            delay: const Duration(milliseconds: 300),
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
            controller: diseaseController,
            label: 'Disease (optional)',
            suffixIcon: const Icon(Icons.health_and_safety),
            keyboardType: TextInputType.name,
            delay: const Duration(milliseconds: 350),
            validator: (String? value) {
              return null;
            },
          ),
          FadeInUp(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 400),
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
                      disease: diseaseController.text,
                      email: user?.email??'',
                    );
                    await provider.updateProfile(
                      firstName: firstNameController.text,
                      secondName: secondNameController.text,
                      gender: genderValue ?? '',
                      weight: weightController.text,
                      height: heightController.text,
                      age: ageController.text,
                      disease: diseaseController.text,
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
                      disease: diseaseController.text,
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
      await prefs.setString('disease', diseaseController.text);
      Get.snackbar('Success', 'Your profile has been created successfully');
      Get.offAll(() => const HomeLayout());
    }
  }
}
