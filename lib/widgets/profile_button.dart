import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_text.dart';

class ProfileButton extends StatelessWidget {
  final IconData startIcon;
  final String text;
  final IconData endIcon;
  final VoidCallback onPress;
  const ProfileButton({super.key,required this.startIcon,required this.text,required this.endIcon,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(


          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.black,
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder()
          ),
          onPressed: onPress, child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(startIcon,size: 30,color: AppColors.white,),
              SizedBox(width: 20,),
              AppText(text: text, fontSize: 18)
            ],
          ),
          Icon(endIcon,size: 30,color: AppColors.white,)
        ],
      )),
    );
  }
}
