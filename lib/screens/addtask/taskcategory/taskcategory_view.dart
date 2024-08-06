import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/addtask/taskcategory/taskcategory_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_text.dart';

class TaskcategoryView extends StatelessWidget {
  const TaskcategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskcategoryController taskcategoryController =
        Get.put(TaskcategoryController());
    return SimpleDialog(
      backgroundColor: AppColors.black500,
      shape: RoundedRectangleBorder(),
      title: AppText(
        text: "Select category",
        fontSize: 20,
      ),
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          height: 300,
          width: 200,
          child: GridView.count(
            crossAxisCount: 3,
            children: List.generate(taskcategoryController.items.length, (index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    taskcategoryController.taskcategortModel.selectedCategory.value=index;
                    Navigator.pop(context);
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.black,
                    padding: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //
                      Icon(taskcategoryController.items[index].icon,color: AppColors.white,),
                      const SizedBox(height: 5),
                      Flexible(
                        child: Text(
                          taskcategoryController.items[index].title,
                          style: const TextStyle(color: AppColors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),


        )
      ],
    );
  }
}
