import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/theme/app_colors.dart';

class Splashview extends StatelessWidget {
  const Splashview({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      // Get.offNamed(Routes.home);
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user != null) {
          Get.offNamed(Routes.home);
        } else {
          Get.offNamed(Routes.intro);
        }
      });



    });
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Center(
        child: Image.asset('assets/images/img.png'),
      ),
    );
  }
}


