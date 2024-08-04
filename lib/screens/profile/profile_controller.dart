import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';

class ProfileController extends GetxController{

  Future<void> logOut() async
  {
    await FirebaseAuth.instance.signOut();
    Get.offNamed(Routes.loginView);
  }
}