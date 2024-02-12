import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notification_widget/list_of_notification_widget.dart';
import 'notification_widget/notification_widget.dart';


class NotificationView extends StatelessWidget {
   List notifications = [
    'Notification 1',
    'Notification 2',
    'Notification 3',
    'Notification 5',
  ];

   List messages = [
    'Message 1',
  ];
  NotificationView({super.key});
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return  DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: Container(
            clipBehavior: Clip.antiAlias,
            decoration:  BoxDecoration(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25),),
              color: theme.primaryColor,
            ),
            child: AppBar(
              title: const Text('Notifications'),
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: 'Notifications',
                  ),
                  Tab(
                    text: 'Messages',
                  )
                ]
              )
            ),
          ),
        ),
        body: TabBarView(
              physics: const BouncingScrollPhysics(),
              children: [
                ListViewNotification(notifications: notifications,icon: Icons.notifications_rounded,),
                ListViewNotification(notifications: messages,icon: Icons.mail_rounded),
              ]
            ),
        ),
    );

  }
}
