import 'package:flutter/material.dart';

class AppInputTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final Icon icon;
  const AppInputTextfield({super.key, required this.hintText, required this.textEditingController, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
        hintText:hintText,
        border: const OutlineInputBorder(),
        icon: icon,
      ),
      controller: textEditingController,
    );
  }
}
