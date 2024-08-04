import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/auth/login/login_model.dart';

class LoginController extends GetxController {
  final LoginModel loginModel = LoginModel();

  final TextEditingController usernameTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  Future<void> login(String email, String password) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      if (user != null) {
        Get.offNamed(Routes.home);
      } else {
        print("User is signed out!");
      }
    } catch (e) {
      print("Error in login ${e}");
    }
  }
}
