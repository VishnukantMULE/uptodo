import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../routes/app_routes.dart';

class AuthService{


  //Register with Email and Password
  Future<void> registerUserEmailPass(String email, String password)
  async {
        try{
          UserCredential userCredential=  await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
          User? user = userCredential.user;
          if (user != null) {
            Get.offNamed(Routes.localAuth);
          } else {
            print("Error in Register!");
          }
        }
        catch(e){
          print("Error Occured in registration ${e}");
        }
  }

  //Login with Register and Password
  Future<void> loginUserEmailPass(String email, String password)
  async {
    try{
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
    catch(e){
      print("Error in Login ${e}");
    }

  }

}