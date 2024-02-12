import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/widgets/custom_button.dart';

class NotificationWidget extends StatefulWidget {
  final String content;
  final String title;
  final int messageNo;
  final IconData icon;

  const NotificationWidget(
      {super.key,
      required this.content,
      required this.messageNo,
      required this.icon,
      required this.title});
  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    // double height = ;
    return GestureDetector(
      onTap: () {
        isExpanded = !isExpanded;
        setState(() {});
      },
      child: AnimatedSize(
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
        reverseDuration: const Duration(milliseconds: 1000),
        child: Container(
          constraints: const BoxConstraints(
            maxWidth: 200.0,
          ),
          width: width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black26,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(' ${widget.messageNo + 1}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(

                      constraints: const BoxConstraints(
                        maxWidth: 250.0,
                      ),
                      child: Text(widget.title,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold))),
                  const Spacer(),
                  Icon(widget.icon),
                ],
              ),
              isExpanded
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          width: width,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white54,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(widget.content,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal)),
                        ),
                        LongButton(
                          label: 'Delete',
                          icon: Icons.delete,
                          onTap: () {
                            print('deleted');
                            setState(() {});
                          },
                          color: Colors.red,
                        ),
                      ],
                    )
                  : Container(), //
              // Container
            ],
          ),
        ),
      ),
    );
  }
}
