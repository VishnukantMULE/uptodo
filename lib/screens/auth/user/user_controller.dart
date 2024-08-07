import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/auth/user/user_model.dart';
import 'package:uptodo/service/firebase_service/firestore_service.dart';
import 'package:uptodo/service/firebase_service/storage_service.dart';

class UserController extends GetxController{
  final UserModel userModel=UserModel();
  final TextEditingController usernameController=TextEditingController();

  void pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      userModel.image=File(pickedFile.path);
      userModel.stateChange.value++;
    }
  }

  void saveProfileData() async {
    try {
      String? imagePath = await StorageService().uploadProfilePhoto(userModel.image!);

      if (imagePath != null) {
        String finalImagePath = imagePath;
        try{
          await FirestoreService().saveUserDetails(usernameController.text, finalImagePath);
          Get.offNamed(Routes.home);
        }
        catch(e){
          print("Error in firestore Service");
        }

      } else {
        print("Failed to upload profile photo. Image path is null.");
      }
    } catch (e) {
      print("Error saving profile data: $e");
    }
  }

}