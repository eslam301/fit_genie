import 'package:fitgenie/pages/food/food_model/food_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../food_data/food_data.dart';

class FoodCheckWidgetView extends StatefulWidget {
  final int index;
  final List listMeal;

  const FoodCheckWidgetView({
    super.key,
    required this.index,
    required this.listMeal,
  });

  @override
  State<FoodCheckWidgetView> createState() => _FoodCheckWidgetViewState();
}

class _FoodCheckWidgetViewState extends State<FoodCheckWidgetView> {
  Color color = Theme.of(Get.context!).colorScheme.secondary.withOpacity(0.4);
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            width: Get.width * 0.75,
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text('${widget.listMeal[widget.index]}',
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                color = color == Colors.green
                    ? Theme.of(Get.context!)
                        .colorScheme
                        .secondary
                        .withOpacity(0.4)
                    : Colors.green;
              });
            },
            child: Icon(
              color == Colors.green
                  ? Icons.check_circle_outline
                  : Icons.circle_outlined,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}
