import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final VoidCallback onclick;
  final String text;
  final bool enable;
  const AppPrimaryButton(
      {super.key, required this.onclick, required this.text,required this.enable});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: enable?AppColors.primary:AppColors.primary500,
            shape:

                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        side:BorderSide(color: enable?Colors.white:AppColors.black)
        ),

        onPressed: onclick,

        child: Text(
          text,
          style:  TextStyle(color: enable?AppColors.white:AppColors.white500),
        ));
  }
}
