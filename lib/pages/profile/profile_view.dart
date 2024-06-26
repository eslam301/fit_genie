import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/pages/profile/profile_widgets/profile_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../fire_base/firebase.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

User? user;

class _ProfilePageState extends State<ProfilePage> {
  String? name;
  String? secondName;
  String? age;
  String? weight;
  String? height;
  String? gender;
  String? disease;

  //-------------------------------------------------------
  String? fitnessGoal;
  String? activityLevel;
  String? workOutLevel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = ApplicationFirebaseAuth.getUserData();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = '${prefs.getString('firstName') ?? ' '} ${prefs.getString('secondName') ?? ''}';
      secondName = prefs.getString('secondName');
      age = prefs.getString('age');
      weight = prefs.getString('weight');
      height = prefs.getString('height');
      gender = prefs.getString('gender');
      disease = prefs.getString('disease');
      fitnessGoal = prefs.getString('fitness_goal');
      activityLevel = prefs.getString('activity_level');
      workOutLevel = prefs.getString('workout_level');
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>>? userMapData = [
      {
        'name': 'name',
        'value': name,
      },
      {
        'name': 'Last Name',
        'value': secondName,
      },
      {
        'name': 'email',
        'value': user?.email,
      },
      {
        'name': 'age',
        'value': age,
      },
      {
        'name': 'weight',
        'value': weight,
      },
      {
        'name': 'workout level',
        'value': workOutLevel,
      },
      {
        'name': 'activity level',
        'value': activityLevel,
      },
      {
        'name': 'fitness goal',
        'value': fitnessGoal,
      },
      {
        'name': 'height',
        'value': height,
      },
      {
        'name': 'gender',
        'value': gender,
      },
      {
        'name': 'disease',
        'value': disease,
      },
      {
        'name': 'ID',
        'value': user?.uid,
      }
    ];
    var theme = Theme.of(context);
    return SingleChildScrollView(
      padding: const EdgeInsets.only(
          top: 26.0, left: 26.0, right: 26.0, bottom: 140.0),
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: theme.colorScheme.secondary,
            radius: 60,
            backgroundImage: const AssetImage(
              'assets/images/profile_picture.png',
            )
          ),
          Text(
             name ?? 'N/A',
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
                userMap: userMapData,
                index: index,
              ),
              physics: const BouncingScrollPhysics(),
              itemCount: userMapData.length,
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
