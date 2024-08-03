import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/auth/login/login_model.dart';

class LoginController extends GetxController{
  final LoginModel loginModel=LoginModel();

  final TextEditingController usernameTextEditingController=TextEditingController();
  final TextEditingController passwordTextEditingController=TextEditingController();
}