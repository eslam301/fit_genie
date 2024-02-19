import 'package:flutter/material.dart';
import 'package:get/get.dart';
class PremiumPlansView extends StatelessWidget {
  static const String routeName = '/premium-plans';

  const PremiumPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Container(),
        actions: [
          IconButton(
            onPressed: (){
              Get.back();
            }, icon: const Icon(Icons.cancel_rounded,size: 30,color: Colors.black26,),
          )
        ]
      ),
      body: Column(
        children: [
          Text('Premium Plans',style: theme.textTheme.headlineLarge,),

        ]
      )
    );
  }
}
