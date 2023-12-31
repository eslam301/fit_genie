import 'package:fitgenie/core/widgets/custom_bottom_sheet.dart';
import 'package:flutter/material.dart';

class DropDownBar extends StatelessWidget {
  List<String> listOfSheet = [];
  String? title;
  DropDownBar({super.key, required this.listOfSheet, this.title});

  @override
  Widget build(BuildContext context) {
    String selectedValue = listOfSheet[0];
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        openBottomSheet(context, listOfSheet);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title!,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              ),
              const Icon(Icons.arrow_drop_down,
                  color: Colors.white),
            ],
          ),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              child: Row(children: [
                Text(
                  selectedValue,
                  style: TextStyle(color: theme.colorScheme.onPrimary, fontSize: 20),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: theme.colorScheme.onPrimary,
                )
              ])),
        ],
      ),
    );
  }

  void openBottomSheet(BuildContext context, List<String> list) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return CustomBottomSheetList(
          list: listOfSheet,
          title: title,
        );
      },
    );
  }
}
