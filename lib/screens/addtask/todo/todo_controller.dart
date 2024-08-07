import 'package:get/get.dart';
import 'package:uptodo/screens/addtask/add_task_controller.dart';


class TodoController extends GetxController
{
  final model=Get.find<AddTaskController>().taskModel;

  void deleteSubTask(int index)
  {
    model.todoList.removeAt(index);
    // print("list in String ${model.todoList.toString()}");
    model.isPriorityTask.value=false;
    model.isPriorityTask.value=true;
  }


  void editSubTask(int index)
  {

  }

}