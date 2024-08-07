import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/auth/user/user_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_input_textfield.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {

    final UserController userController=Get.put(UserController());
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
        title: const AppText(text: "Enter Your Details", fontSize: 18),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 30),
        children: [
          Container(
            margin: const EdgeInsets.all(40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 5),
                      borderRadius: const BorderRadius.all(Radius.circular(100)),
                    ),
                    child:Obx((){
                      return  ClipOval(
                        key: Key(userController.userModel.stateChange.value.toString()),
                        child: userController.userModel.image == null
                            ? Image.network(
                          'https://picsum.photos/200',
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        )
                            : Image.file(
                          userController.userModel.image!,
                          width: 140,
                          height: 140,
                          fit: BoxFit.cover,
                        ),
                      );
                    }),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      userController.pickImage();
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                      size: 40,
                      color: AppColors.white500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          AppInputTextfield(hintText: "Enter Name", textEditingController: userController.usernameController, icon: Icon(Icons.usb), label: "User Name", isPassword: false, errotext: '', isError: false),
          SizedBox(height: MediaQuery.of(context).size.height*0.30,),
          AppPrimaryButton(onclick: (){
            userController.saveProfileData();
          }, text: "Save", enable: true)
        ],
      ),
    );
  }
}
