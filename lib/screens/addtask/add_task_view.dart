import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/addtask/taskcategory/taskcategory_controller.dart';
import 'package:uptodo/screens/addtask/taskcategory/taskcategory_view.dart';
import 'package:uptodo/screens/addtask/todo/todo_controller.dart';
import 'package:uptodo/screens/addtask/todo/todo_view.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/util/date_formatter_util.dart';
import 'package:uptodo/widgets/app_date_button.dart';

import 'package:uptodo/widgets/app_input_textfield_2.dart';
import 'package:uptodo/widgets/app_primary_button.dart';

import 'package:uptodo/widgets/app_text.dart';
import 'package:uptodo/widgets/select_button.dart';

import 'add_task_controller.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});

  final AddTaskController controller = Get.put(AddTaskController());
  final TodoController todoController = Get.put(TodoController());
  final TaskcategoryController taskcategoryController=Get.put(TaskcategoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Center(
            child: Text(
          "Add Task",
          style: TextStyle(color: Colors.white, fontSize: 18),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 80, 0, 0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
              color: AppColors.black,
              border: Border(
                  right: BorderSide(color: AppColors.white500),
                  top: BorderSide(color: AppColors.white500),
                  left: BorderSide(color: AppColors.white500)),
              borderRadius: BorderRadius.vertical(top: Radius.circular(40))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: [
                const SizedBox(
                  height: 40,
                ),
                const AppText(text: "Choose Category", fontSize: 20),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  constraints: const BoxConstraints(
                    maxWidth: 50,
                    maxHeight: 120,
                  ),
                  child: ElevatedButton(

                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (ctx) => TaskcategoryView());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(100, 100),
                    ),
                    child: Obx((){
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          // Icon(Icons.school,color: Colors.white,size:35,),
                          Icon(taskcategoryController.items[taskcategoryController.taskcategortModel.selectedCategory.value].icon,color: AppColors.primary,size: 45,),
                          SizedBox(height: 5),
                          Text(
                            taskcategoryController.items[taskcategoryController.taskcategortModel.selectedCategory.value].title,
                            style: TextStyle(color: AppColors.black),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        const AppText(
                          text: 'Start',
                          fontSize: 18,
                        ),
                        Obx(() {
                          return AppDateButton(
                            isCurrentDate:
                                controller.taskModel.isStartDateSelected.value,
                            text: DateFormatterUtil().DateFormateyMMMd(
                                controller.taskModel.startDate.value),
                            buttonclick: () {
                              controller.selectStartDate(context);
                            },
                          );
                        })
                      ],
                    ),
                    Column(
                      children: [
                        const AppText(
                          text: 'End',
                          fontSize: 18,
                        ),
                        AppDateButton(
                          isCurrentDate: false,
                          text: DateFormatterUtil().DateFormateyMMMd(
                              controller.taskModel.endDate.value),
                          buttonclick: () {
                            controller.selectEndDate(context);
                          },
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppText(
                    text: "Title",
                    fontSize: 20,
                  ),
                ),
                AppInputTextfield2(
                  hinttext: "Enter Task title",
                  maxline: 1,
                  inputController: controller.titlecontroller,
                ),
                const SizedBox(
                  height: 40,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: AppText(
                    text: "Task Priority",
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(() {
                      return SelectButton(
                        text: 'Priority Task',
                        isSelect: controller.taskModel.isPriotyTask.value,
                        buttonClick: controller.onoffPriorityTask,
                      );
                    }),
                    Obx(() {
                      return SelectButton(
                        text: 'Daily Task',
                        isSelect: controller.taskModel.isDailyTask.value,
                        buttonClick: controller.onoffDailyTask,
                      );
                    })
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const AppText(
                  text: "Description",
                  fontSize: 20,
                ),
                AppInputTextfield2(
                  hinttext: "Enter Task Description ...",
                  maxline: 5,
                  inputController: controller.desctiptionController,
                ),
                const SizedBox(
                  height: 40,
                ),
                Obx(() {
                  List<String> todolist =
                      controller.taskModel.todoList.toList();
                  return controller.taskModel.isPriotyTask.value
                      ? TodoView(
                          subTaskList: controller.taskModel.todoList,
                          addsubTask: controller.addSubTask,
                          subtaskController: controller.subTaskController,
                        )
                      : const SizedBox();
                }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppPrimaryButton(
                    text: "Create Task",
                    onclick: () {
                      controller.taskModel.selectedCategory=taskcategoryController.taskcategortModel.selectedCategory.value;
                      controller.createTask();
                    },
                    enable: true,
                  ),
                )
              ],
            ),
          ),
          // color:Colors.white,
        ),
      ),
    );
  }
}
