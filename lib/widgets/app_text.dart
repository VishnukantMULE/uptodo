import 'package:flutter/cupertino.dart';
import 'package:uptodo/theme/app_colors.dart';

class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  const AppText({super.key,required this.text,required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(color: AppColors.white,fontSize: fontSize),);
  }
}
