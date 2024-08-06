import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/profile/profile_model.dart';

class ProfileController extends GetxController{

  final TextEditingController nameController=TextEditingController();

  Future<void> logOut() async
  {
    await FirebaseAuth.instance.signOut();
    Get.offNamed(Routes.loginView);
  }

  Future<void> saveUserName()
  async {

    FirebaseAuth.instance.authStateChanges().listen((User? user) async{
      if (user != null) {
        ProfileModel profileModel =ProfileModel(name: nameController.text);
        CollectionReference userprofile=FirebaseFirestore.instance.collection("user");
        await userprofile.doc(user.email).update(profileModel.profileMap());
        print("saved");
      } else {
        print("Not saved");
      }
    });


  }

  Future<ProfileModel?> getUserProfile() async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      try {
        // Reference the Firestore collection
        DocumentReference userProfileRef = FirebaseFirestore.instance.collection('user').doc(user.email);

        // Fetch the document snapshot
        DocumentSnapshot docSnapshot = await userProfileRef.get();

        if (docSnapshot.exists) {
          // Convert the document data to a ProfileModel
          Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
          // return profileModel;
        } else {
          print('No user data found');
        }
      } catch (e) {
        print('Error retrieving user data: $e');
      }
    } else {
      print('User not logged in');
    }
    return null;
  }



}