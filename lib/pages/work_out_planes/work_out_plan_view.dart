import 'package:fitgenie/pages/work_out_planes/widget/work_out_Item_container.dart';
import 'package:flutter/material.dart';

class WorkOutPlanView extends StatelessWidget {
  const WorkOutPlanView({super.key});

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return  Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Recommended WorkOut',
                style: TextStyle(color: Colors.white, fontSize: 20),
                textAlign: TextAlign.left),
            const SizedBox(
              height: 20
            ),
            Expanded(
              child: ListView.separated(
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.only(bottom: 120),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index)=> const WorkOutWidgetItem(),
                separatorBuilder: (context, index) => const SizedBox(height: 20,),
              ),
            )

          ]),
    );
  }
}
