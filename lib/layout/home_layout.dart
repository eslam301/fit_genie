import 'package:fitgenie/pages/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/widgets/custom_drawer.dart';
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
    var theme = Theme.of(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text('FitGenie'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Get.to(
                    () => const ProfilePage(),
                transition: Transition.leftToRightWithFade,
              );
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: theme.primaryColor.withOpacity(0.4),
              width: .2,
            ),
          ),
        ),
        child: Column(
          children: [
            screens[index],
          ],
        ),
      ),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAlias,
        height: 80,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25),
        ),),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            index = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: 'Home',
              backgroundColor: theme.colorScheme.background,
              activeIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.home,
                  )),
            ),
            BottomNavigationBarItem(

              icon: const Icon(Icons.fastfood_rounded),
              label: 'Food',
              backgroundColor: theme.colorScheme.onPrimary,
              activeIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.fastfood_rounded,
                  )),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.newspaper_outlined),
              label: 'planes',

              backgroundColor: theme.colorScheme.onSecondary,
              activeIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.newspaper_outlined,
                  )),
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.settings),
              label: 'settings',
              backgroundColor: theme.colorScheme.secondary,
              activeIcon: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.settings,
                  )),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: theme.primaryColor,
          foregroundColor: Colors.white,
          shape: const CircleBorder(),
          elevation: 10,
          highlightElevation: 0,
          hoverElevation: 0,
          child: const Icon(Icons.device_hub_rounded),

        ),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
