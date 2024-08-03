import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';
import '../../../widgets/app_heading_text.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

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
          AppHeadingText(text: "Register"),
          // AppInputTextfield(hintText: "Enter your Username", textEditingController: textEditingController, icon: icon)

        ],
      ),
    );
  }
}
