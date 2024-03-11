import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/app_provider.dart';
class MyAppBottomNavigationBar extends StatelessWidget {
  final PageController pageController;
  const MyAppBottomNavigationBar ({super.key, required this.pageController});

  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return Container(
        clipBehavior: Clip.antiAlias,
        height: 80,
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
                    icon: const Icon(Icons.home_rounded),
                    label: 'Home',

                    activeIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.home_rounded,
                          color: Colors.black,
                        )),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.newspaper_rounded),
                    label: 'News',

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
                    icon: const Icon(Icons.fastfood_rounded),
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
                    icon: const Icon(Icons.calendar_month_outlined),
                    label: 'planes',

                    activeIcon: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.calendar_month_outlined,
                        )),
                  ),
                  BottomNavigationBarItem(
                    icon: const Icon(Icons.settings),
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
