import 'package:fitgenie/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/profile/profile_view.dart';
import '../pages/settings/setting_view.dart';
class HomeLayout extends StatefulWidget {
  static const String routeName = '/home';

  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  List<Widget> screens = [
    const HomeView(),
    const SettingsView(),
    const SettingsView(),
    const SettingsView(),
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Get.to(() =>  const ProfilePage(),transition: Transition.leftToRightWithFade,);
            },
            icon: const Icon(Icons.person),
          ),
        title: const Text('fitGenie'),
        actions: [
          IconButton(
            onPressed: (){

            },
            icon: const Icon(Icons.search),
          )
        ],

      ),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value){
          index = value;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood_rounded),
            label: 'Food',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            label: 'planes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],


      ),

    );
  }
}
