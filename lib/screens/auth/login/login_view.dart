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
          AppInputTextfield(
            hintText: "Enter Your Username",
            textEditingController:
                loginController.usernameTextEditingController,
            icon: const Icon(Icons.person),
            label: "User Name",
            isPassword: false,
          ),
          AppInputTextfield(
            hintText: ".* * * * * * * * * *",
            textEditingController:
                loginController.passwordTextEditingController,
            icon: const Icon(Icons.person),
            label: "Password",
            isPassword: true,
          ),
          AppPrimaryButton(onclick: () {}, text: "Login"),
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
              const Text("Don’t have an account?",style: TextStyle(color: AppColors.white500,fontSize: 16),),
              TextButton(onPressed: (){
                Get.offNamed(Routes.registerView);
              }, child: const AppText(text: "Register", fontSize: 18))

            ],
          )
        ],
      ),
    );
  }
}
