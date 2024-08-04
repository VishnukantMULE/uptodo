import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/profile/profile_controller.dart';
import 'package:uptodo/widgets/app_primary_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController=Get.put(ProfileController());
    return  Scaffold(
      body: Center(
        child: AppPrimaryButton(onclick: (){
          profileController.logOut();
        }, text: "Log Out"),
      ),
    );
  }
}
