import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StepsContainerView extends StatelessWidget {
  const StepsContainerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 140,
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'steps',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.normal),
            ),
            Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/running_shoe.svg',
                  height: 30,
                  width: 30,
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('250 steps', style: TextStyle(color: Colors.white)),
              ],
            ),
            const Text(
              'Goal : 1,000',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            LinearProgressIndicator(
              value: 0.8,
              backgroundColor: Colors.white,
              valueColor:
                  const AlwaysStoppedAnimation<Color>(Color(0xffFFC107)),
              minHeight: 4,
              borderRadius: BorderRadius.circular(20),
            ),
          ]),
    );
  }
}
