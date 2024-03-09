import 'package:flutter/material.dart';
import '../../premium/premium_plans_view.dart';

class AdsContainer extends StatefulWidget {
  const AdsContainer({super.key});

  @override
  State<AdsContainer> createState() => _AdsContainerState();
}

class _AdsContainerState extends State<AdsContainer> with TickerProviderStateMixin{
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        BottomSheet.createAnimationController(this);
    controller.duration = const Duration(milliseconds: 750);
    controller.reverseDuration = const Duration(milliseconds: 750);

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            enableDrag: true,
            isScrollControlled: true,
            backgroundColor: theme.scaffoldBackgroundColor.withOpacity(1.0),
            useSafeArea: true,
            showDragHandle: true,
            transitionAnimationController: controller,
            context: context,
            builder: (context) => const PremiumPlansView());
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:  const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.workspace_premium_rounded,
              color: Colors.black,
              size: 30,
            ),
            Text(
              'Get the premium plans',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w500),
            ),
            Icon(
              Icons.arrow_forward_rounded,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
