import 'package:flutter/material.dart';

class WideContainer extends StatefulWidget {
  final String? title;
  final String? subtitle;
  final String? description;
  final String? intensityLevel;
  final String? caloriesBurnt;
  final String? time;

  const WideContainer({
    super.key,
    this.title,
    this.subtitle,
    this.description,
    this.intensityLevel,
    this.caloriesBurnt,
    this.time,
  });

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
        height: heightScreen * 0.22,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: theme.colorScheme.secondary.withOpacity(0.4),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              height: heightScreen * 0.35,
              width: widthScreen * 0.22,
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                color: isFinished
                    ? Colors.teal.withOpacity(0.8)
                    : theme.primaryColor.withOpacity(0.8),
              ),
              duration: const Duration(milliseconds: 100),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Text(
                        widget.title ?? ' ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isFinished ? 1.0 : 0.2,
                      child: Icon(
                        isFinished ? Icons.check_circle : Icons.circle_outlined,
                      ),
                    )
                  ]),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: widthScreen * 0.6,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Text(
                        "play: ${widget.subtitle}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "level: ${widget.intensityLevel}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Burnt: ${widget.caloriesBurnt}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "Description: ${widget.description}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        "time: ${widget.time}",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
