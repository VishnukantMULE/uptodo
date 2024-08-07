import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/auth/register/register_model.dart';
import 'package:uptodo/service/firebase_service/auth_service.dart';

class RegisterController extends GetxController {
  final RegisterModel registerModel = RegisterModel();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  Future<void> registerUserEmailPass(String email, String password) async {
    try {
      await AuthService().registerUserEmailPass(email, password);
      Get.offNamed(Routes.localAuth);

      // print("register User : ${userCredential.user}");
    } catch (e) {
      print("Error registering user: $e");
    }
  }
  Future<void> registerwithGmail() async{
    try{

    }
    catch(e)
    {
      print("Register view Email : ${e}");
    }
  }
}
