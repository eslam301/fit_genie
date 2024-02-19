import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';
import '../../pages/profile/profile_view.dart';
import '../../pages/sign-in/sign_in.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
        width: width * 0.8,
        decoration: BoxDecoration(
            color: theme.colorScheme.background.withOpacity(0.9),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20.0),
              bottomRight: Radius.circular(30.0),
            )),
        child: Stack(
          children: [
            Column(children: [
              Container(
                width: double.infinity,
                height: height * 0.17,
                padding: EdgeInsets.only(top: height * 0.05),
                decoration: BoxDecoration(
                    color: theme.colorScheme.onPrimary,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25.0),
                      bottomRight: Radius.circular(25.0),
                    )),
                child: Center(
                  child: Text(
                    'FitGenie',
                    style: TextStyle(
                        color: theme.primaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                  child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                    ListTile(
                        iconColor: theme.primaryColor,
                        trailing: const Icon(
                          Icons.account_circle,
                          size: 30,
                        ),
                        title: Text(
                          'Profile',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Get.to(
                                () => const ProfilePage(),
                            transition: Transition.rightToLeftWithFade,
                          );
                        }),
                    ListTile(
                      iconColor: theme.primaryColor,
                        title: Text(
                          'change theme',
                          style: TextStyle(
                              color: theme.primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                        trailing: Icon(
                          themeController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
                          size: 30,
                        ),
                        onTap: () {
                          themeController.toggleTheme();

                        }),
                    ListTile(
                        title: Row(
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                  color: theme.colorScheme.error,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            Icon(
                              Icons.logout,
                              color: theme.colorScheme.error,
                            )
                          ],
                        ),
                        onTap: () {
                          Get.off(
                            () => const SignInPage(),
                            transition: Transition.fadeIn,
                          );
                        }),
                  ]))
            ]),
            Positioned(
              right: 10,
              top: height / 2.1,
              child: Container(
                  width: 5,
                  height: 40,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: theme.primaryColor,
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  )),
            ),
          ],
        ));
  }
}
