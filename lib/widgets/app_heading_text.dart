import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class AppHeadingText extends StatelessWidget {
  final String text;
  const AppHeadingText({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 40,fontWeight: FontWeight.w600,color: AppColors.white),);
  }
}
