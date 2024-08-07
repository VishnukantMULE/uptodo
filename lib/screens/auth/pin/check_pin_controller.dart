import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/service/firebase_service/firestore_service.dart';

class CheckPinController extends GetxController{
  final TextEditingController pin1Con=TextEditingController();
  final TextEditingController pin2Con=TextEditingController();
  final TextEditingController pin3Con=TextEditingController();
  final TextEditingController pin4Con=TextEditingController();

  late String enteredPin;
  late RxBool isError =false.obs;

  void checkPin() async
  {
    enteredPin=pin1Con.text+pin2Con.text+pin3Con.text+pin4Con.text;
    bool isMatched=await FirestoreService().checkPins(enteredPin);
    if(isMatched)
      {
        Get.offNamed(Routes.home);
      }
    else
      {
        isError.value=true;
        print("Pin Doesnt Matched");
      }

  }
}