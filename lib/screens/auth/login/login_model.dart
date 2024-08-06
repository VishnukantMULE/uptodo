import 'package:get/get.dart';

class LoginModel{
  late String username;
  late String password;

  late RxString emailErrorText="".obs;
  late RxString passwordErrorText="".obs;
  RxBool isFill=false.obs;
  RxBool isUserNameError=false.obs;
  RxBool isPasswordError=false.obs;


}