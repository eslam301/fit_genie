import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/pages/profile/profile_widgets/profile_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../fire_base/firebase.dart';
import '../sign-in/sign_in.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = '/profile';

  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

User? user;

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = ApplicationFirebaseAuth.getUserData();
    // print(userName);
    // print(email);
    // print(photo);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>? userMap = [
      {
        'name': 'Name',
        'value': user?.displayName,
      },
      {
        'name': 'email',
        'value': user?.email,
      },
      {
        'name': 'age',
        'value': 22,
      },
      {
        'name': 'weight',
        'value': 70,
      },
      {
        'name': 'height',
        'value': 170,
      },
      {
        'name': 'gender',
        'value': 'male',
      },
      {
        'name': 'disease',
        'value': 'none',
      },
      {
        'name': 'ID',
        'value': user?.uid,
      }
    ];
    var theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 26.0, left: 26.0, right: 26.0, bottom: 140.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: theme.colorScheme.secondary,
            radius: 60,
            backgroundImage: NetworkImage(user?.photoURL ?? ''),
          ),
          Text(
            user?.displayName ?? 'UserNull',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'free plan',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: theme.colorScheme.secondary,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: theme.colorScheme.secondary.withOpacity(0.7),
              borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) => ProfileRowWidget(
                userMap: userMap,
                index: index,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: userMap.length,
            ),
          ),
          LongButton(
              label: 'LogOut',
              onTap: () {
                ApplicationFirebaseAuth.signOutFireBase();
              }).paddingOnly(top: 20, bottom: 20),
          // Add more details or widgets as needed
        ],
      ),
    );
  }
}
