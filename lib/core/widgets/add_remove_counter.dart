import 'package:flutter/material.dart';

class AddRemoveCounter extends StatefulWidget {
  int counter;
  AddRemoveCounter({super.key, this.counter = 0});

  @override
  State<AddRemoveCounter> createState() => _AddRemoveCounterState();
}

class _AddRemoveCounterState extends State<AddRemoveCounter> {
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      IconButton(
          onPressed: () {
            setState(() {widget.counter++;});
          },
          icon: const Icon(Icons.add)),
      Text(
        "${widget.counter} h",
        style: const TextStyle(color: Colors.white, fontSize: 20),
      ),
      IconButton(
          onPressed: () {
            if (widget.counter > 0) {
              widget.counter--;
            } else {
              widget.counter = 0;
            }
            setState(() {});
          },
          icon: const Icon(Icons.remove)),
    ]);
  }
}
