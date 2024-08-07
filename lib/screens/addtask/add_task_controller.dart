import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/service/firebase_service/firestore_service.dart';


import 'add_task_model.dart';

class AddTaskController extends GetxController
{
  final AddTaskModel taskModel=AddTaskModel();

  TextEditingController titlecontroller=TextEditingController();
  TextEditingController desctiptionController=TextEditingController();
  TextEditingController subTaskController=TextEditingController();

  selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: taskModel.startDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != taskModel.startDate) {

      taskModel.startDate.value = picked;
      taskModel.isStartDateSelected.value=false;

    }
    if(taskModel.endDate.value.isBefore(taskModel.endDate.value))
    {
      taskModel.endDate.value=taskModel.endDate.value;
    }
  }

  selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: taskModel.startDate.value,
      firstDate: taskModel.startDate.value,
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != taskModel.endDate.value) {

      taskModel.endDate.value = picked;

    }
  }

  void onoffPriorityTask()
  {
    taskModel.isPriorityTask.value^=true;
    taskModel.isDailyTask.value^=true;
  }
  void onoffDailyTask()
  {
    taskModel.isDailyTask.value^=true;
    taskModel.isPriorityTask.value^=true;
  }


  void createTask() async
  {
    taskModel.title=titlecontroller.text;
    taskModel.description=desctiptionController.text;

    if(taskModel.isPriorityTask.value==true)
    {
      // DbService().createPriorityTask(taskModel.startDate.value.toString(), taskModel.endDate.value.toString(), taskModel.title, taskModel.description, taskModel.todoList.toString(),taskModel.statusList.toString());
     await FirestoreService().createNewTask(taskModel.selectedCategory.toString(), taskModel.title, taskModel.description, taskModel.isPriorityTask.value, taskModel.isDailyTask.value, taskModel.startDate.value.toString(), taskModel.endDate.value.toString(), taskModel.todoList.toString(), taskModel.status, taskModel.statusList.toString(), "", "");
      print("Priority task Added ${taskModel.startDate.value.toString()},${taskModel.endDate.value.toString()}, ${taskModel.title}, ${taskModel.description}, ${taskModel.todoList.toString()},${taskModel.statusList.toString()}, selected Category: ${taskModel.selectedCategory}");
    }
    if(taskModel.isDailyTask.value==true)
    {
      await FirestoreService().createNewTask(taskModel.selectedCategory.toString(), taskModel.title, taskModel.description, taskModel.isPriorityTask.value, taskModel.isDailyTask.value, taskModel.startDate.value.toString(), taskModel.endDate.value.toString(), taskModel.todoList.toString(), taskModel.status, taskModel.statusList.toString(), "", "");
      // DbService().createDailyTask(taskModel.startDate.value.toString(), taskModel.endDate.value.toString(), taskModel.title, taskModel.description,taskModel.status.toString());
      print("Daily Task Added");
    }
  }


  void addSubTask()
  {
    taskModel.todoList.add(subTaskController.text);
    subTaskController.text="";
    taskModel.isPriorityTask.value=false;
    taskModel.isPriorityTask.value=true;

  }


}