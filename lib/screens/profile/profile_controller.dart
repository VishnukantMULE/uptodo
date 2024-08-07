
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:uptodo/routes/app_routes.dart';
import 'package:uptodo/screens/profile/profile_model.dart';
import 'package:uptodo/service/firebase_service/firestore_service.dart';


String profilePhotoLink="https://picsum.photos/200";
class ProfileController extends GetxController{
  RxInt profileState=0.obs;
  late ProfileModel profileModel=ProfileModel(name: 'unknown', imagePath: 'https://picsum.photos/200');
  late TextEditingController nameController=TextEditingController(text: profileModel.name);


  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  void fetchUserData() async{
    Map<String, dynamic>? userData=await FirestoreService().getUserDetails();
    if (userData != null) {

      profileModel=ProfileModel.fromMap(userData);
      profilePhotoLink=profileModel.imagePath;
      profileState.value++;

    } else {
      print("Failed to retrieve");
    }
  }


  void updateUserName()
  {
    FirestoreService().updateUserName(nameController.text);
    profileModel.name=nameController.text;
    profileState.value++;
  }









  Future<void> logOut() async
  {
    await FirebaseAuth.instance.signOut();
    Get.offNamed(Routes.loginView);
  }

  Future<void> saveUserName()
  async {

    FirebaseAuth.instance.authStateChanges().listen((User? user) async{
      if (user != null) {
        // ProfileModel profileModel =ProfileModel(name: nameController.text);
        // CollectionReference userprofile=FirebaseFirestore.instance.collection("user");
        // await userprofile.doc(user.email).update(profileModel.profileMap());
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
        DocumentReference userProfileRef = FirebaseFirestore.instance.collection('user').doc(user.email);

        DocumentSnapshot docSnapshot = await userProfileRef.get();

        if (docSnapshot.exists) {
          Map<String, dynamic> data = docSnapshot.data() as Map<String, dynamic>;
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