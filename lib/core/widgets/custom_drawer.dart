import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      width:  width*0.65,
      decoration: BoxDecoration(
        color: theme.colorScheme.background.withOpacity(0.9),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        )
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: width*0.65,
                height: height*0.17,
                padding: EdgeInsets.only(top: height*0.05),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onPrimary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  )
                ),
                child: Center(
                  child: Text('FitGenie', style: TextStyle(color: theme.primaryColor,fontSize: 36,fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListTile(
                      title: Text('progress', style: TextStyle(color: theme.primaryColor,fontSize: 20,fontWeight: FontWeight.w500),),
                      onTap: (){
                        Get.back();
                      }
                    ),
                    ListTile(
                      title: Text('change theme', style: TextStyle(color: theme.primaryColor,fontSize: 20,fontWeight: FontWeight.w500),),
                      onTap: (){
                        Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);

                      }
                    ),

                  ]
                )
              )
            ]
          ),
          Positioned(
            right: 5,
            top: height/2.1,
            child: Container(
                width:5 ,height: 40,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: theme.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                )
            ),
          ),
        ],
      )
    );
  }
}
