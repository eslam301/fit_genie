import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Icon? suffixIcon;
  final keyBoardType;

  const CustomTextField(
      {required this.controller,
      required this.label,
      super.key,
      this.isPassword = false,
      this.suffixIcon,
      this.keyBoardType});
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        keyboardType: widget.keyBoardType,
        obscureText: widget.isPassword ? obscureText : false,
        controller: widget.controller,
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: const Icon(Icons.remove_red_eye),
                )
              : widget.suffixIcon,
          filled: true,
          fillColor: Colors.white,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          labelText: widget.label,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          )),
        ),
      ),
    );
  }
}
