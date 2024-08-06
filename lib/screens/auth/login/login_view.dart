import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/screens/auth/login/login_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_heading_text.dart';
import 'package:uptodo/widgets/app_input_textfield.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';

import '../../../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.put(LoginController());

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(Routes.authOption);
            },
            icon: const Icon(
              CupertinoIcons.back,
              color: AppColors.white,
            )),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(
            height: 40,
          ),
          const AppHeadingText(text: "Login"),
          const SizedBox(
            height: 40,
          ),

      Obx((){
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Email",
              style: TextStyle(color: AppColors.white, fontSize: 18),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              style: const TextStyle(color: AppColors.white),
              obscureText: false,
              onChanged: (val){
                loginController.validateEmail(val);
              },
              decoration: InputDecoration(
                errorText: loginController.loginModel.isUserNameError.value==true?loginController.loginModel.emailErrorText.value:null,
                hintText: "Enter User Name",
                hintStyle: const TextStyle(color: AppColors.white500),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                // icon: icon,
              ),
              controller: loginController.usernameTextEditingController,
            ),
            const SizedBox(
              height: 30,
            )
          ],
        );
      }),

          Obx((){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(color: AppColors.white, fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  style: const TextStyle(color: AppColors.white),
                  obscureText: true,
                  onChanged: (val){
                    loginController.validatePassword(val);
                  },
                  decoration: InputDecoration(
                    errorText: loginController.loginModel.isPasswordError.value==true?loginController.loginModel.passwordErrorText.value:null,
                    hintText: "Enter User Name",
                    hintStyle: const TextStyle(color: AppColors.white500),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                    // icon: icon,
                  ),
                  controller: loginController.passwordTextEditingController,
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            );
          }),
          Obx((){
            return AppPrimaryButton(
                onclick: () {
                  loginController.loginModel.isFill.value==true?loginController.login(
                      loginController.usernameTextEditingController.text,
                      loginController.passwordTextEditingController.text):(){};
                },
                text: "Login", enable: loginController.loginModel.isFill.value==true,);

          }),
          const SizedBox(
            height: 40,
          ),
          const Row(
            children: [
              Expanded(child: Divider()),
              AppText(text: "   Or   ", fontSize: 18),
              Expanded(child: Divider())
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Don’t have an account?",
                style: TextStyle(color: AppColors.white500, fontSize: 16),
              ),
              TextButton(
                  onPressed: () {
                    Get.offNamed(Routes.registerView);
                  },
                  child: const AppText(text: "Register", fontSize: 18))
            ],
          )
        ],
      ),
    );
  }
}
