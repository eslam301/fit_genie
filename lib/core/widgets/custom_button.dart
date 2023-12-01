import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label ;
  Function onTap;
  CustomButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        height: 50,
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),

        child: Row(
          children: [
            Text(label, style: const TextStyle(color: Colors.white,fontSize: 20),),
            const Spacer(),
            const Icon(Icons.arrow_forward,color: Colors.white,)
          ],
        ),
      ),
    );
  }
}
