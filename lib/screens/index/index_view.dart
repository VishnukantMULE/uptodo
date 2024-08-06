import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/index/index_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_heading_text.dart';
import 'package:uptodo/widgets/app_text.dart';

class IndexView extends StatelessWidget {
  const IndexView({super.key});

  @override
  Widget build(BuildContext context) {
    final IndexController indexController=Get.put(IndexController());
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.black,
        title: const AppText(text: "Index", fontSize: 18),
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.all(2),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(50)),
            child: ClipOval(
              child: Image.asset(
                "assets/images/img.png",
              ),
            ),
          )
        ],
      ),
      body:Obx((){
        return indexController.indexModel.isNoIndex.isTrue? ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Image.asset("assets/images/img_4.png"),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: AppHeadingText(text: "What do you want to do today?"),
            ),
            const Text(
              "Tap + to add your tasks",
              textAlign: TextAlign.center,
              style: TextStyle(color: AppColors.white, fontSize: 18),
            )
          ],
        ):
        const Text("dddddd");
      })
    );
  }
}
