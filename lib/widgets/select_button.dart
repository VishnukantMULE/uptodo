import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class SelectButton extends StatelessWidget {
  final bool isSelect;
  final String text;
  final VoidCallback buttonClick;
  const SelectButton({super.key, required this.text,required this.isSelect, required this.buttonClick});

  @override
  Widget build(BuildContext context) {
    Color buttonBg=AppColors.white;
    Color textColor=AppColors.primary;
    if(isSelect==true){
      buttonBg=AppColors.primary;
      textColor=AppColors.white;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: ElevatedButton(onPressed:buttonClick,
          style: ElevatedButton.styleFrom(
              backgroundColor: buttonBg,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              fixedSize: Size(MediaQuery.of(context).size.width*0.40, 55)

          ),
          child: Text(text,style: TextStyle(color: textColor,fontSize: 15),)),
    );
  }
}