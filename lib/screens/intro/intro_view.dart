import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/intro/intro_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/intro_container_view.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    final IntroController introController = Get.put(IntroController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leading: TextButton(
            onPressed: () {
              Get.offNamed(Routes.authOption);
            },
            child: const Text(
              "Skip",
              style: TextStyle(color: AppColors.white500, fontSize: 15),
            )),
      ),
      backgroundColor: AppColors.black,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          Obx(() {
            return IntroContainerView(
              slideNo: introController.introModel.slideNo.value,
            );
          }),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(() {
                return introController.introModel.hideBack.value
                    ? Text('')
                    : TextButton(
                        onPressed: () {
                          introController.onBack();
                        },
                        child: const Text(
                          "Back",
                          style: TextStyle(color: AppColors.white),
                        ));
              }),
              AppPrimaryButton(
                  onclick: () {
                    introController.onNext();
                  },
                  text: "Next")
            ],
          )
        ],
      ),
    );
  }
}
