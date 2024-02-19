import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Column(
      children: [
        const SizedBox(height: 10),
        DefaultTabController(
            length: 2,
            child: TabBar(
              dividerHeight: 0,
              labelColor: Colors.white,
              indicatorColor: Colors.transparent,
              tabs: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white
                    )
                  ),
                  child: const Text('Text'),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: Colors.white
                    )
                  ),
                  child: const Text('Text'),
                ),
              ],
            ))
      ],
    );
  }
}
