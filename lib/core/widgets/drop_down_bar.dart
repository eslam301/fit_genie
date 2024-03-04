import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../main.dart';

class DropDownBarTheme extends StatefulWidget {
  const DropDownBarTheme({super.key});

  @override
  State<DropDownBarTheme> createState() => _DropDownBarState();

}

class _DropDownBarState extends State<DropDownBarTheme> {
  String? _selected = Get.isDarkMode ? "Dark" : "Light";
  final List<String> _items = ["Light", "Dark"];
  ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showBottomSheet(context);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "App Theme",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Text(
                  _selected ?? _items.first,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.grey[700]),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_drop_down,
                  color: Colors.grey[700],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        enableDrag: true,
        context: context,
        builder: (context) {

          return Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(45),
                topRight: Radius.circular(45),
              ),
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.8),
            ),
            height: 500,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  width: 50,
                  height: 5,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white
                  )
                ),
                const Text(
                  "Choose Theme",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _selected = "Light";
                      themeController.changeTheme("Light");
                      Get.back();
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Light',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[700]),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.light_mode,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _selected = "Dark";
                      themeController.changeTheme("Dark");
                      Get.back();
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Text(
                          'Dark',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.grey[700]),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.dark_mode,
                          color: Colors.grey[700],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ) ;
        });

  }
}
