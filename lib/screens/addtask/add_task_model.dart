import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AddTaskModel
{
  late String title;
  late String description;
  late int selectedCategory;
  RxBool isPriorityTask=false.obs;
  RxBool isDailyTask=true.obs;
  Rx<DateTime> startDate=DateTime.now().obs;
  Rx<DateTime> endDate=DateTime.now().obs;

  late String subtask="";
  RxBool isStartDateSelected=true.obs;

  bool status=false;

  List<String> todoList=[];
  List<bool> statusList=[];

}