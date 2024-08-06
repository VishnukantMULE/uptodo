import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/screens/auth/localauth/local_auth_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';
import 'package:uptodo/widgets/pin_widget.dart';

import '../../../routes/app_routes.dart';

class PinView extends StatelessWidget {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
    final LocalAuthController localAuthController=Get.put(LocalAuthController());
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
        title: const AppText(text: "Set a new Pin", fontSize: 18),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.white),
                  color: AppColors.black,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.white500.withOpacity(0.75),
                      // spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(2, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/img.png",
                  scale: 4,
                )),
          ),
          const SizedBox(
            height: 50,
          ),
          const AppText(text: "Please Enter a Pin", fontSize: 18),
           PinWidget(pin1C: localAuthController.pin1E, pin2C: localAuthController.pin2E, pin3C: localAuthController.pin3E, pin4C:localAuthController.pin4E ,),
          const AppText(text: "Re-Enter the Pin", fontSize: 18),
          PinWidget(pin1C: localAuthController.pin1R, pin2C: localAuthController.pin2R, pin3C: localAuthController.pin3R, pin4C:localAuthController.pin4R ,),
          const SizedBox(
            height: 250,
          ),
          AppPrimaryButton(onclick: () {
            localAuthController.checkMatch();
          }, text: "Next", enable: true,)
        ],
      ),
    );
  }
}
