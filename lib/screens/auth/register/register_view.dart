import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../routes/app_routes.dart';
import '../../../theme/app_colors.dart';

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
    );
  }
}
