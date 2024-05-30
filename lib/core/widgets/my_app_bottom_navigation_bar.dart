import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';
class MyAppBottomNavigationBar extends StatelessWidget {
  final PageController pageController;
  const MyAppBottomNavigationBar ({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAlias,
        // height: 100,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: Selector<AppProvider, int>(
            selector: (_, provider) => provider.getPageIndexValue,
            builder: (context, value, child) {
              return BottomNavigationBar(
                currentIndex: value,
                onTap: (value) {
                  pageController.jumpToPage(value);
                },
                items: [
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.dashboard_outlined),
                    label: 'Dashboard',

                    activeIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.dashboard,
                          color: Colors.black,
                        )),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.newspaper_outlined),
                    label: 'NewsFeed',

                    activeIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.newspaper_rounded,
                          color: Colors.black,
                        )),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.fastfood_outlined),
                    label: 'Food',

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
                    icon: const Icon(Icons.fitness_center_outlined),
                    label: 'plans',

                    activeIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.fitness_center_sharp,
                        )),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings_outlined),
                    label: 'settings',
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
              );
            }

        ));
  }
}
