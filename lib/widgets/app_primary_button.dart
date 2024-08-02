import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final VoidCallback onclick;
  final String text;
  const AppPrimaryButton(
      {super.key, required this.onclick, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onclick,
        child: Text(
          text,
          style: const TextStyle(color: AppColors.white),
        ));
  }
}
