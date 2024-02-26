import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.screenHeight,
    required this.controller,
    required this.hintText,
    required this.icon,
    required this.obscureText,
    this.validator,
    required this.keyboardType,
    required this.labelText,
  });

  final double screenHeight;
  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: const Color(0xFF111827).withOpacity(0.5),
      ),
    );
    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            size: 20,
            color: const Color(0xFF111827).withOpacity(0.5),
          ),
          fillColor: Colors.white,
          focusColor: Colors.white,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 14,
          ),
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          border: outlineInputBorder,
        ),
      ),
    );
  }
}
