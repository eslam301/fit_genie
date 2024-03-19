import 'package:flutter/material.dart';

class WorkOutWidgetItem extends StatelessWidget {
  const WorkOutWidgetItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Image(image: AssetImage('assets/images/cardio.png'), filterQuality: FilterQuality.high,)),
          SizedBox(height: 10),
          Text('Cardio', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 18),),
          Text('Total Body Power', textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 20),),
          Text('28 Days . 4 Days per week', textAlign: TextAlign.left, style: TextStyle(color: Colors.grey, fontSize: 15),),
        ],
      ),
    );
  }
}
