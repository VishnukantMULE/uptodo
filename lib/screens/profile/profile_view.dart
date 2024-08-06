import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/addtask/taskcategory/taskcategory_view.dart';
import 'package:uptodo/screens/profile/profile_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_input_textfield.dart';
import 'package:uptodo/widgets/app_primary_button.dart';
import 'package:uptodo/widgets/app_text.dart';
import 'package:uptodo/widgets/log_out.dart';
import 'package:uptodo/widgets/profile_button.dart';

class ProfileView extends StatelessWidget {

  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;

    final ProfileController profileController=Get.put(ProfileController());
    return  Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        automaticallyImplyLeading: false,
        title: AppText(text: "profile", fontSize: 20),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [

          Container(
            padding: EdgeInsets.all(40),
            child:Column(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.black500
                  ),
                  child: ClipOval(
                    child: Image.asset("assets/images/img.png"),

                  ),
                ),
                SizedBox(height: 10,),
                StreamBuilder<QuerySnapshot>(stream:
                    _firestore.collection("user").snapshots(), builder: (context,snapshot){

                  final userDocs = snapshot.data?.docs;
                  final userDoc = userDocs?[0];
                  final userData = userDoc?.data() as Map<String, dynamic>;
                  return AppText(text: userData["name"].toString(), fontSize: 18);
                })
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: MediaQuery.of(context).size.height*0.18,
                height: MediaQuery.of(context).size.width*0.18,
                decoration: BoxDecoration(
                  color: AppColors.black500,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: AppText(text: "10 Task left",fontSize: 22,)),
              ),
              Container(
                width: MediaQuery.of(context).size.height*0.18,
                height: MediaQuery.of(context).size.width*0.18,
                decoration: BoxDecoration(
                    color: AppColors.black500,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(child: AppText(text: "5 Task done",fontSize: 22,)),
              )
            ],
          ),
          SizedBox(height: 30,),
          const AppText(text: "Settings", fontSize: 20),
          ProfileButton(startIcon: Icons.settings, text: "App Settings", endIcon: Icons.navigate_next, onPress: (){
          }),
          
          
          
          const AppText(text: "Account", fontSize: 20),
          ProfileButton(startIcon: Icons.person_2_outlined, text: "Change account name", endIcon: Icons.navigate_next, onPress: (){
            showDialog(
                context: context,
                builder: (ctx) => SimpleDialog(

                  backgroundColor: AppColors.black500,
                  shape: RoundedRectangleBorder(),
                  title: AppText(
                    text: "Select category",
                    fontSize: 20,
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          AppInputTextfield(hintText: "name", textEditingController: profileController.nameController, icon: Icon(Icons.verified_user), label: "", isPassword: false, errotext: "", isError: false),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppPrimaryButton(onclick: (){}, text: "Edit", enable: true),
                              AppPrimaryButton(onclick: (){
                                profileController.saveUserName();

                              }, text: "Save", enable: true)
                            ],
                          )
                        ],
                      ),
                    )


                  ],
                ));


          }),
          ProfileButton(startIcon: Icons.key, text: "Change account password", endIcon: Icons.navigate_next, onPress: (){}),
          ProfileButton(startIcon: Icons.camera_alt, text: "Change account Image", endIcon: Icons.navigate_next, onPress: (){}),

          const AppText(text: "Uptodo", fontSize: 20),
          ProfileButton(startIcon: Icons.menu, text: "About US", endIcon: Icons.navigate_next, onPress: (){}),
          ProfileButton(startIcon: Icons.info_outline, text: "FAQ", endIcon: Icons.navigate_next, onPress: (){}),
          ProfileButton(startIcon: Icons.electric_bolt, text: "Help & Feedback", endIcon: Icons.navigate_next, onPress: (){}),
          ProfileButton(startIcon: Icons.thumb_up_alt_outlined, text: "Support US", endIcon: Icons.navigate_next, onPress: (){}),
          LogOut(onPress: (){ profileController.logOut();}),
        ],
      )
    );
  }
}
