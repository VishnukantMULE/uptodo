import 'package:flutter/material.dart';
import 'package:uptodo/theme/app_colors.dart';

class IntroContainerView extends StatelessWidget {
  final int slideNo;
  const IntroContainerView({super.key,required this.slideNo});





  @override
  Widget build(BuildContext context) {


    late bool isSlideOne=false;
    late bool isSlideTwo=false;
    late bool isSlideThree=false;

    List<Widget> imageslist=[
      Image.asset('assets/images/img_1.png'),
      Image.asset('assets/images/img_2.png'),
      Image.asset('assets/images/img_3.png')
    ];

    List<String> textHeading=[
      "Manage your tasks",
      "Create daily routine",
      "Orgonaize your tasks"
    ];
    List<String> textSubheading=[
      "You can easily manage all of your daily tasks in DoMe for free",
      "In Uptodo  you can create your personalized routine to stay productive",
      "You can organize your daily tasks by adding your tasks into separate categories"
    ];

    if(slideNo==0)
      {
        isSlideOne=true;
      }
    if(slideNo==1)
      {
        isSlideTwo=true;
      }
    if(slideNo==2)
      {
        isSlideThree=true;
      }
    return Container(
      child: Column(
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.50,
              child: imageslist[slideNo],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: isSlideOne?AppColors.white:AppColors.white500,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 50,
                height: 10,
                // color: Colors.white,
              ),
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                  color: isSlideTwo?AppColors.white:AppColors.white500,
                  borderRadius: BorderRadius.circular(10)
                ),
                width: 50,
                height: 10,
                // color: Colors.white,
              ),
              const SizedBox(width: 10,),
              Container(
                decoration: BoxDecoration(
                    color: isSlideThree?AppColors.white:AppColors.white500,
                    borderRadius: BorderRadius.circular(10)
                ),
                width: 50,
                height: 10,
                // color: Colors.white,
              ),
            ],
          ),
          SizedBox(height: 20,),
          Text(textHeading[slideNo],style: TextStyle(color: AppColors.white,fontSize: 30),),
          Text(textSubheading[slideNo],style: TextStyle(color: AppColors.white500,fontSize: 18,),textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
