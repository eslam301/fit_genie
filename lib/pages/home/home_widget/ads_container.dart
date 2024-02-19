import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../premium/premium_plans_view.dart';

class AdsContainer extends StatelessWidget {
  const AdsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() =>  const PremiumPlansView(),transition: Transition.downToUp,duration: const Duration(milliseconds: 600));
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.workspace_premium_rounded,color: Colors.black,size: 30,),
            Text('Get the premium plans',style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.w500),),
            Icon(Icons.arrow_forward_rounded,color: Colors.black,size: 30,),
          ],
        ),
      ),
    );
  }
}
