import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';

import '../../../routes/app_routes.dart';

class PinView extends StatelessWidget {
  const PinView({super.key});

  @override
  Widget build(BuildContext context) {
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
          Form(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 64,
                    width: 68,
                    child: TextFormField(
                      obscureText: true,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onSaved: (pin1) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      maxLength: 1,
                      decoration: const InputDecoration(
                          counterText: "", border: OutlineInputBorder()),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                    width: 68,
                    child: TextFormField(
                      obscureText: true,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onSaved: (pin2) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      maxLength: 1,
                      decoration: const InputDecoration(
                          counterText: "", border: OutlineInputBorder()),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                    width: 68,
                    child: TextFormField(
                      obscureText: true,

                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onSaved: (pin3) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      maxLength: 1,
                      decoration: const InputDecoration(
                          counterText: "", border: OutlineInputBorder()),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                    width: 68,
                    child: TextFormField(
                      obscureText: true,
                      autofocus: true,
                      keyboardType: TextInputType.number,
                      onSaved: (pin4) {},
                      onChanged: (value) {
                        if (value.length == 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      maxLength: 1,
                      decoration: const InputDecoration(
                          counterText: "", border: OutlineInputBorder()),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppColors.white),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 400,),
          AppPrimaryButton(onclick: (){}, text:"Next" )
        ],
      ),
    );
  }
}
