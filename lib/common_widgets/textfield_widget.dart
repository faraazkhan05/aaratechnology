import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;
   int? maxLines;
   TextInputType? keyType;
   TextFieldWidget({
    Key? key,
    required this.controller,
    required this.label,
    required this.obscure,
    this.keyType,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(keyboardType: keyType,maxLength:maxLines ,
      obscureText: obscure,
      style: const TextStyle(
        color: Colors.grey,
      ),
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.zero,
          labelText: label,
          labelStyle: const TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.w400)),
      controller: controller,
    );
  }
}
