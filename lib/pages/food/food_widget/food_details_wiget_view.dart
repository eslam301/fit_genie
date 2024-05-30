import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/app_provider.dart';
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
  bool isChecked = false;
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppProvider>(context);
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        clipBehavior: Clip.antiAlias,
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        width: Get.width * 0.75,
        height: isExpanded ?  Get.height * 0.15: Get.height * 0.06,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              height: double.infinity,
              color: color,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeIn,
              child: Checkbox(
                value: isChecked,
                key: Key(widget.listMeal[widget.index]),
                onChanged: (value) {
                  setState(() {
                    isChecked = value!;
                    color = isChecked
                        ? Colors.teal
                        : Theme.of(context).colorScheme.secondary.withOpacity(0.4);
                  });
                },
                fillColor: MaterialStateProperty.all(color),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Text('${widget.listMeal[widget.index]}',
                textAlign: TextAlign.start,
              ).paddingAll(10),
            ),
          ],
        ),
      ),
    );
  }
}
