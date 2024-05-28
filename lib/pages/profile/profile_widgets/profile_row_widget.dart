import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileRowWidget extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  final List<Map<String, dynamic>>? userMap;
  final int index;
  const ProfileRowWidget({super.key, this.userMap, required this.index});

  @override
  Widget build(BuildContext context) {
    String? name = userMap![index]['name'] ?? 'Name';
    String? value = userMap![index]['value'].toString();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
          color: Colors.grey.shade300,
        )),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            name!,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            value.capitalize!.isEmpty ? 'N/A' : value.capitalize??'N/A',
            softWrap: true,
            style: TextStyle(
                fontSize: value.length > 12 ? 16.0 : 21.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
