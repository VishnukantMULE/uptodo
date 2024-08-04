import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/screens/auth/register/register_controller.dart';
import 'package:uptodo/widgets/app_input_textfield.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/app_heading_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final RegisterController registerController=Get.put(RegisterController());
    return Scaffold(
      backgroundColor:AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(onPressed: (){Get.offNamed(Routes.authOption);}, icon: const Icon(CupertinoIcons.back,color: AppColors.white,)),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 40,),
          const AppHeadingText(text: "Register"),
          const SizedBox(height: 20,),
          AppInputTextfield(hintText: "Enter your Username", textEditingController: registerController.usernameController, icon: Icon(Icons.person), label: "Username", isPassword: false),
          AppInputTextfield(hintText: "* * * * * * * *", textEditingController: registerController.passwordController, icon: Icon(Icons.person), label: "Password", isPassword: true),
          AppInputTextfield(hintText: "* * * * * * * *", textEditingController: registerController.rePasswordController, icon: Icon(Icons.person), label: "Confirm Password", isPassword: true),
          AppPrimaryButton(onclick: (){
            registerController.registerUserEmailPass(registerController.usernameController.text, registerController.passwordController.text);
          }, text: "Register"),
          const SizedBox(height: 30,),
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
              const Text("Already have an account? ",style: TextStyle(color: AppColors.white500,fontSize: 16),),
              TextButton(onPressed: (){
                Get.offNamed(Routes.loginView);
              }, child: const AppText(text: "Login", fontSize: 18))

            ],
          )
        ],
      ),
    );
  }
}
