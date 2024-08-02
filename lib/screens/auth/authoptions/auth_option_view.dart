import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_primary_button.dart';

class AuthOptionView extends StatelessWidget {
  const AuthOptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(Routes.intro);
            },
            icon: Icon(
              CupertinoIcons.back,
              color: AppColors.white,
            )),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Welcome to UpTodo",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w600,
                color: AppColors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Please login to your account or create new account to continue",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: AppColors.white),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 400,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: AppPrimaryButton(
                onclick: () {
                  Get.offNamed(Routes.loginView);
                },
                text: "Login"),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    side: BorderSide(color: Colors.white, width: 2)),
                onPressed: () {
                  Get.offNamed(Routes.registerView);
                },
                child: const Text(
                  "Create New Account",
                  style: TextStyle(color: AppColors.white),
                )),
          ),
        ],
      ),
    );
  }
}
