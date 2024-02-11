import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/widgets/notification_widget/notification_widget.dart';

class NotificationView extends StatelessWidget {
   List notifications = [
    'Notification 1',
    'Notification 2',
  ];
  NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration:  BoxDecoration(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25),),
            color: theme.primaryColor,
          ),
          child: AppBar(
            title: const Text('Notifications'),
          ),
        ),
      ),
      body:  Center(
        child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 15,),
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          itemCount: notifications.length,
          itemBuilder: (context, index) => NotificationWidget( content: notifications[index], messageNo: index,),
        ),

      ),

    );

  }
}
