import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Icon? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Duration delay;
  final Duration duration;
  final Color? backgroundColor;

  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.label,
      this.isPassword = false,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.duration = const Duration(milliseconds: 400),
      this.delay = const Duration(milliseconds: 100),
      this.backgroundColor})
      : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return FadeInUp(
      duration: widget.duration,
      delay: widget.delay,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: TextFormField(
          keyboardType: widget.keyboardType,
          validator: widget.validator,
          obscureText: widget.isPassword ? obscureText : false,
          controller: widget.controller,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontFamily: 'Cairo',
          ),
          decoration: InputDecoration(
            suffixIcon: _buildSuffixIcon(),
            filled: true,
            fillColor:
                widget.backgroundColor ?? theme.primaryColor.withOpacity(0.4),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            floatingLabelStyle:
                const TextStyle(color: Colors.teal, fontSize: 18),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            labelText: widget.label,
            labelStyle: const TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.teal),
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.isPassword) {
      return IconButton(
        onPressed: _toggleObscureText,
        icon: Icon(
          obscureText ? Icons.visibility_off : Icons.visibility,
          color: Colors.grey,
        ),
      );
    }
    return widget.suffixIcon != null
        ? Icon(widget.suffixIcon!.icon, color: Colors.grey)
        : null;
  }

  void _toggleObscureText() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}
