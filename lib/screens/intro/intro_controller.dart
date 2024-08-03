import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/intro/intro_model.dart';

class IntroController extends GetxController {
  final IntroModel introModel = IntroModel();
  void onNext() {
    if (introModel.slideNo.value < 2) {
      introModel.slideNo.value++;
      if (introModel.slideNo.value >= 1) {
        introModel.hideBack.value = false;
      }
    } else {
      Get.offNamed(Routes.authOption);
    }
  }

  void onBack() {
    introModel.slideNo.value--;
    if (introModel.slideNo.value < 1) {
      introModel.hideBack.value = true;
    }
  }
}
