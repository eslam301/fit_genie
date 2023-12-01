import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class RequiredForm extends StatelessWidget {
  RequiredForm({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController data1Controller = TextEditingController();
  final TextEditingController data2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Required Data"),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: null,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              CustomTextField(controller: firstNameController, label: 'Name'),
              CustomTextField(controller: firstNameController, label: 'Name'),
              CustomTextField(controller: firstNameController, label: 'Name'),
              CustomTextField(controller: firstNameController, label: 'Name'),
              CustomTextField(controller: firstNameController, label: 'Name'),
              CustomTextField(controller: firstNameController, label: 'Name'),
              CustomButton(label:'submit' , onTap: (){})
            ]),
          ),
        )));
  }
}
