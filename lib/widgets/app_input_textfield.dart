import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class AppInputTextfield extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;
  final String label;
  final Icon icon;
  final bool isPassword;
  const AppInputTextfield(
      {super.key,
      required this.hintText,
      required this.textEditingController,
      required this.icon,
      required this.label,
      required this.isPassword,
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppColors.white, fontSize: 18),
          textAlign: TextAlign.left,
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          style: const TextStyle(
            color: AppColors.white
          ),
          obscureText: isPassword,
          decoration: InputDecoration(

            hintText: hintText,
            hintStyle: const TextStyle(color: AppColors.white500),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            // icon: icon,

          ),
          controller: textEditingController,
        ),
        const SizedBox(height: 30,)
      ],
    );
  }
}
