import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String label ;
  final VoidCallback onTap;
  final Color? color ;
  final IconData? icon;
  const LongButton({super.key, required this.label, required this.onTap, this.color, this.icon});
  @override
  Widget build(BuildContext context) {
    var theme  = Theme.of(context);
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: double.infinity,
        // margin: const EdgeInsets.symmetric(horizontal: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration:  BoxDecoration(
          color: color ?? theme.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: [
            Text(label, style: const TextStyle(color: Colors.white,fontSize: 18),),
            const Spacer(),
            Icon( icon?? Icons.arrow_forward ,color: Colors.white,size: 18,)
          ],
        ),
      ),
    );
  }
}
