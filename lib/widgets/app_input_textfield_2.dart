import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class AppInputTextfield2 extends StatelessWidget {

  final String hinttext;
  final int maxline;
  final TextEditingController inputController;
  const AppInputTextfield2({super.key,required this.hinttext,required this.maxline,required this.inputController});

  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.all(8.0),
      child: TextField(
        maxLines: maxline,
        controller: inputController,
        style: TextStyle(color: AppColors.white),

        decoration: InputDecoration(
            hintText:hinttext,
            hintStyle: const TextStyle(color: AppColors.white500,fontWeight: FontWeight.w500),

            border: const OutlineInputBorder(
            )
        ),
      ),
    );
  }
}
