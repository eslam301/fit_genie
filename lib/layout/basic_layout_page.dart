import 'package:flutter/material.dart';

class LayOutPageView extends StatelessWidget {
  final String appBarTitle;
  final TextStyle? appBarTitleStyle;
  final Widget body;
  const LayOutPageView({
    super.key,
    required this.appBarTitle,
    required this.body,
    this.appBarTitleStyle,
  });
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              color: theme.primaryColor,
            ),
            child: AppBar(
              title: Text(appBarTitle),
              centerTitle: true,
              titleTextStyle: appBarTitleStyle ??
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: body);
  }
}
