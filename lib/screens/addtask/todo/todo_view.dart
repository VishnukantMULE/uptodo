import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/addtask/todo/todo_controller.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_heading_text.dart';
import 'package:uptodo/widgets/app_input_textfield_2.dart';
import 'package:uptodo/widgets/app_text.dart';


class TodoView extends StatelessWidget {

  final List<String> subTaskList;
  final VoidCallback addsubTask;

  final TextEditingController subtaskController;




  TodoView({super.key, required this.subTaskList,required this.addsubTask,required this.subtaskController});


  final TodoController todoController=Get.find();


  @override
  Widget build(BuildContext context) {
    // todoController.todoModel.taskTodoList.addAll(subTaskList);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const AppText(text: "Add subtask",fontSize: 18,),

        // subtasklist.map<Widget>((e){
        //   return Text(e);
        // }),
        Padding(
          padding: const EdgeInsets.all(20),
          child: ListView.builder(
              shrinkWrap: true,
              // itemCount: subTaskList.length,
              itemCount: subTaskList.length,
              itemBuilder: (context, index){
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(child: Text("${index+1} . ${subTaskList[index]}",style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500,color: AppColors.white),)),
                      Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: AppColors.white500,)),
                          IconButton(onPressed: (){
                            todoController.deleteSubTask(index);
                          }, icon: Icon(Icons.delete,color: Colors.red,)),
                        ],
                      ),

                    ],
                  ),
                );
              }),
        ),



        Row(
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width*0.65,
              child: AppInputTextfield2(hinttext: 'enter subtask', maxline: 1, inputController: subtaskController,),

            ),


            ElevatedButton(onPressed: addsubTask,

                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(110, 50),
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                    )
                ),

                child:  const Row(
                  children: <Widget>[
                    Icon(Icons.add,color: AppColors.white,),
                    SizedBox(width: 5,),
                    Text("Add",style: TextStyle(color: AppColors.white),)
                  ],
                )

            )
          ],
        ),
        const SizedBox(height: 10,)
      ],
    );
  }
}