import 'dart:core';
import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class AppDateButton extends StatelessWidget {
  final bool isCurrentDate;
  final VoidCallback buttonclick;
  final String text;

  const AppDateButton(
      {super.key,
        required this.isCurrentDate,
        required this.text,
        required this.buttonclick});

  @override
  Widget build(BuildContext context) {
    Color buttonBg = AppColors.white;
    Color iconColor = AppColors.primary;
    Color textColor = AppColors.black;

    if (isCurrentDate == true) {
      buttonBg = AppColors.primary;
      iconColor = AppColors.white;
      textColor=AppColors.white;

    }

    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: AppColors.primary,
                backgroundColor: buttonBg,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                fixedSize: Size(MediaQuery.of(context).size.width * 0.42, 55)),

            // onPressed: _selectDate(context),
            onPressed: buttonclick,
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(child: Text(text,style:  TextStyle(color: textColor),))
              ],
            )));
  }
}