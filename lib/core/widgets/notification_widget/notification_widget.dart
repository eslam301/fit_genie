import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  String content ;
  int messageNo;
  NotificationWidget({
    super.key,
    required this.content,
    required this.messageNo
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints(
        maxWidth: 200.0,
      ),
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(' ${messageNo+1}',style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          const SizedBox(width: 15,),
          Container(
              constraints: BoxConstraints(
                maxWidth: 250.0,
              ),
              child: Text(content)),
          const Spacer(),
          Icon(Icons.notifications),
        ],
      ),
    );
  }
}
