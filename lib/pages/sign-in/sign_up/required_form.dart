import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_drop_down/custom_drop_down_par.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../fire_base/firebase.dart';

class RequiredForm extends StatefulWidget {
  static const String routeName = '/requiredForm';
  final String? email;
  final String? password;
  final String? name;

  const RequiredForm({
    super.key,
    this.email,
    this.password,
    this.name,
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
    return SingleChildScrollView(
        child: Form(
      key: submitFormKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: [
          CustomTextField(
            controller: firstNameController,
            label: 'Name',
            suffixIcon: const Icon(Icons.person),
            keyBoardType: TextInputType.name,
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
            keyBoardType: TextInputType.name,
            delay: const Duration(milliseconds: 100),
            validator: (String? value) {
              return null;
            },
          ),
          FadeInUp(
              duration: const Duration(milliseconds: 400),
              delay: const Duration(milliseconds: 150),
              child: CustomDropDown(
                label: "Gender" ,
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
            keyBoardType: TextInputType.number,
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
            keyBoardType: TextInputType.number,
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
            keyBoardType: TextInputType.number,
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
            keyBoardType: TextInputType.name,
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
                onTap: () {
                  submit();
                }),
          )
        ]),
      ),
    ));
  }

  void submit() {
    if (submitFormKey.currentState!.validate()) {
      saveSignToFireBase(
          emailController: widget.email!,
          passwordController: widget.password!,
          nameController: widget.name!);
    }
  }
}
