import 'package:animate_do/animate_do.dart';
import 'package:fitgenie/pages/premium/premium_plans_widget/premium_plans_widget_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumPlansView extends StatelessWidget {
  static const String routeName = '/premium-plans';

  const PremiumPlansView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
      child: Column(children: [
        Row(
          children: [
            Text(
              'Premium Plans',
              style: theme.textTheme.headlineLarge,
            ),
            const Icon(
              Icons.workspace_premium_rounded,
              color: Colors.amber,
            ),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(
                  Icons.cancel_outlined,
                  color: Colors.red,
                  size: 30,
                )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text('Get access to premium features'),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              FadeInLeft(
                duration: const Duration(milliseconds: 700),
                delay: const Duration(milliseconds: 200),
                child: PlanContainer(
                  title: 'Weekly plan',
                  price: '5.49/week',
                  descriptionListPlan: const [
                    'weekly workout plan',
                    'weekly meal plan',
                  ],
                  callbackAction: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 700),
                delay: const Duration(milliseconds: 400),
                child: PlanContainer(
                  title: 'Monthly plan',
                  price: '18.49/month',
                  descriptionListPlan: const [
                    'month WorkOut plan',
                    'month Meal plan',
                  ],
                  nonFeatureListPlan: const [
                    'free plan',
                    'free plan',
                  ],
                  callbackAction: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FadeInLeft(
                duration: const Duration(milliseconds: 700),
                delay: const Duration(milliseconds: 600),
                child: PlanContainer(
                  title: 'Yearly plan',
                  price: '210.49/year',
                  descriptionListPlan: const [
                    'yearly Workout plan',
                    'yearly Meal plan',
                  ],
                  nonFeatureListPlan: const [
                    'free plan',
                    'free plan',
                  ],
                  callbackAction: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),

      ]),
    );
  }
}
