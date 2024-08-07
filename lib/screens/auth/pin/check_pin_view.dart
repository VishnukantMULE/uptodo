import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/auth/pin/check_pin_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';
import 'package:uptodo/widgets/pin_widget.dart';

class CheckPinView extends StatelessWidget {
  const CheckPinView({super.key});

  @override
  Widget build(BuildContext context) {
    final CheckPinController controller=Get.put(CheckPinController());
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
        title: const AppText(text: "please Enter Pin", fontSize: 18),
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
                      offset: Offset(2, 3),
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
          PinWidget(pin1C: controller.pin1Con, pin2C: controller.pin2Con, pin3C: controller.pin3Con, pin4C:controller.pin4Con ,),
            const SizedBox(
            height: 250,
          ),

          Obx((){
            return controller.isError.value?const Text("Please Enter Correct Pin",style: TextStyle(color: Colors.red,fontSize: 20),textAlign: TextAlign.center,):const Text("");
          }),

          AppPrimaryButton(onclick: () {
            controller.checkPin();
          }, text: "Next", enable: true,)
        ],
      ),
    );
  }
}
