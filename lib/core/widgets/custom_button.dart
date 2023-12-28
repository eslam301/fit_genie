import 'package:flutter/material.dart';

class LongButton extends StatelessWidget {
  final String label ;
  final VoidCallback onTap;
  const LongButton({super.key, required this.label, required this.onTap});
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
          color: theme.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Row(
          children: [
            Text(label, style: TextStyle(color: theme.colorScheme.onPrimary,fontSize: 20),),
            const Spacer(),
            Icon(Icons.arrow_forward,color: theme.colorScheme.onPrimary,)
          ],
        ),
      ),
    );
  }
}
