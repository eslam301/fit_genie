import 'package:fitgenie/pages/work_out_planes/widget/work_out_item-container.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_api.dart';
import 'package:fitgenie/pages/work_out_planes/work_out_model/work_out_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import '../../core/widgets/custom_text_field.dart';

class WorkOutPlanView extends StatefulWidget {
  const WorkOutPlanView({super.key});

  @override
  State<WorkOutPlanView> createState() => _WorkOutPlanViewState();
}

class _WorkOutPlanViewState extends State<WorkOutPlanView> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Row(
        children: [
          Icon(Icons.fitness_center_sharp, color: theme.colorScheme.secondary),
          const SizedBox(width: 10),
          Text(
            'WorkOut Plan',
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
        ],
      ).paddingOnly(top: 20, left: 20),
      const SizedBox(height: 20),
      // Form(
      //     key: formKey,
      //     child: Column(
      //   children: [
      //     CustomTextField(controller: _emailController, label: 'email',),
      //     ElevatedButton(onPressed: (){
      //       if(formKey.currentState!.validate()){
      //         post(_emailController.text as Uri);
      //       }
      //     }, child: const Text('Submit'))
      //   ],
      // )),
      Expanded(
          child: FutureBuilder(
        future: WorkOutApiManger.fetchWorkOutData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error Check your connection'),
                    SizedBox(width: 10),
                    Icon(
                      Icons.wifi_off,
                      size: 30,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () {
                    setState(() {
                      WorkOutApiManger.fetchWorkOutData();
                    });
                  },
                  icon: const Icon(Icons.refresh_sharp),
                )
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text('Loading...', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 20),
                  CircularProgressIndicator(),
                ]));
          } else if (snapshot.hasData) {
            WorkOutPlansModel workOutModel = snapshot.data as WorkOutPlansModel;

            return ListView(
              padding: const EdgeInsets.only(bottom: 120, left: 16, right: 16),
              children: [
                WorkOutWidgetItem(
                  exerciseModel: workOutModel,
                  exerciseModel1: workOutModel.cardio,
                ).paddingOnly(bottom: 10),
                WorkOutWidgetItem(
                  exerciseModel: workOutModel,
                  exerciseModel1: workOutModel.strengthTraining,
                ).paddingOnly(bottom: 10),
                WorkOutWidgetItem(
                  exerciseModel: workOutModel,
                  exerciseModel1: workOutModel.flexibility,
                ).paddingOnly(bottom: 10),
              ],
            );
          } else {
            return const Center(
              child: Text('No Data Found'),
            );
          }
        },
      ))
    ]);
    ;
  }
}
