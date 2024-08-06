import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_text.dart';

class LogOut extends StatelessWidget {

  final VoidCallback onPress;
  const LogOut({super.key,required this.onPress});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(


          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.black,
              padding: EdgeInsets.zero,
              shape: const RoundedRectangleBorder()
          ),
          onPressed: onPress, child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.logout,size: 30,color: Colors.red,),
              SizedBox(width: 20,),
              Text("Log Out",style: TextStyle(color: Colors.red,fontSize: 18),)
            ],
          ),

        ],
      )),
    );
  }
}
