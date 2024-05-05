import 'package:flutter/material.dart';

class WideContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  final String description;

  const WideContainer(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.description});

  @override
  State<WideContainer> createState() => _WideContainerState();
}

class _WideContainerState extends State<WideContainer> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          isFinished = !isFinished;
        });

      },
      child: Container(
        height: heightScreen * 0.12,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              height: heightScreen * 0.25,
              width: widthScreen * 0.20,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: isFinished ? Colors.teal.withOpacity(0.8) : theme.primaryColor.withOpacity(0.8),
              ),
              duration: const Duration(milliseconds: 100),
              child: Center(
                child: Text(
                  widget.title,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.subtitle,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ])
          ],
        ),
      ),
    );
  }
}
