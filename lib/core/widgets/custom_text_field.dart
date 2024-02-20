import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  final Icon? suffixIcon;
  final TextInputType? keyBoardType;
  final FormFieldValidator<String>? validator;


  const CustomTextField({
      required this.controller,
      required this.label,
      super.key,
      this.isPassword = false,
      this.suffixIcon,
      this.keyBoardType,
      this.validator
  });
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}
class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    //var theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        keyboardType: widget.keyBoardType,
        validator: widget.validator,
        obscureText: widget.isPassword ? obscureText : false,
        controller: widget.controller,
        style: const TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
          suffixIcon: widget.isPassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    });
                  },
                  icon: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
                )
              : widget.suffixIcon,
          suffixIconColor: Colors.grey,
          filled: true,
          fillColor: Colors.white,
          floatingLabelStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          labelText: widget.label,
          labelStyle: const TextStyle(
            color: Colors.grey,
          ),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          )),
        ),
      ),
    );
  }
}
