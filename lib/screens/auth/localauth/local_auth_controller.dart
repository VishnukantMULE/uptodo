import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';

class LocalAuthController extends GetxController{
  late String enterPin;
  late String reEnterPin;

  late TextEditingController pin1E=TextEditingController();
  late TextEditingController pin2E=TextEditingController();
  late TextEditingController pin3E=TextEditingController();
  late TextEditingController pin4E=TextEditingController();


  late TextEditingController pin1R=TextEditingController();
  late TextEditingController pin2R=TextEditingController();
  late TextEditingController pin3R=TextEditingController();
  late TextEditingController pin4R=TextEditingController();

  void checkMatch()
  {
    enterPin=pin1E.text+pin2E.text+pin3E.text+pin4E.text;
    reEnterPin=pin1R.text+pin2R.text+pin3R.text+pin4R.text;

    if(enterPin==reEnterPin)
      {
        Get.offNamed(Routes.home);
      }
  }
}