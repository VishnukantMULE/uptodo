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

  void validateEmail(String email) {
    if (email.trim().isEmpty) {
      loginModel.isUserNameError.value = true;
      loginModel.isFill.value = false;

      loginModel.emailErrorText.value = "Please enter an email";
    } else if (!isEmail(email)) {
      loginModel.isFill.value = false;

      loginModel.isUserNameError.value = true;
      loginModel.emailErrorText.value = "Please enter a valid email";
    } else {
      loginModel.isUserNameError.value = false;
      loginModel.emailErrorText.value = "";
      loginModel.isFill.value = false;

      if (passwordTextEditingController.text.isNotEmpty &&
          loginModel.isUserNameError.value == false &&
          loginModel.isPasswordError.value == false) {
        loginModel.isFill.value = true;
      }
    }
  }

  void validatePassword(String pass) {
    if (pass.trim().isEmpty) {
      loginModel.isPasswordError.value = true;
      loginModel.passwordErrorText.value = "Please enter Password";
      loginModel.isFill.value = false;
    } else if (pass.length < 6) {
      loginModel.isPasswordError.value = true;
      loginModel.passwordErrorText.value =
          "Password Length should be less then 6";
      loginModel.isFill.value = false;
    } else {
      loginModel.isPasswordError.value = false;
      loginModel.passwordErrorText.value = "";
      if (loginModel.isPasswordError.value == false &&
          usernameTextEditingController.text.isNotEmpty &&
          loginModel.isUserNameError.value == false) {
        loginModel.isFill.value = true;
      }
    }
  }

  bool isEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(email);
  }
}
