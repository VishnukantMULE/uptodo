import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_heading_text.dart';
import 'package:uptodo/widgets/app_input_textfield.dart';

import '../../../routes/app_routes.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: IconButton(onPressed: (){Get.offNamed(Routes.authOption);}, icon: const Icon(CupertinoIcons.back,color: AppColors.white,)),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 40,),
          AppHeadingText(text: "Login"),
          // AppInputTextfield(hintText: "Enter your Username", textEditingController: textEditingController, icon: icon)

        ],
      ),
    );
  }
}
