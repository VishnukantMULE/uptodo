import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  Future<void> saveUserDetails(String userName, String profileImage) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userProfile =
          FirebaseFirestore.instance.collection("userdetails");
      await userProfile.doc(user.email).set({
        "username": userName,
        "profileimage": profileImage,
      });
      print("Data Saved Successfully");
    } else {
      print("User is not authenticated.");
    }
  }

  Future<Map<String, dynamic>?> getUserDetails() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userProfile =
          FirebaseFirestore.instance.collection("userdetails");
      DocumentSnapshot doc = await userProfile.doc(user.email).get();

      if (doc.exists) {
        return doc.data() as Map<String, dynamic>;
      } else {
        print("No user data found.");
        return null;
      }
    } else {
      print("User is not authenticated.");
      return null;
    }
  }

  Future<void> updateUserName(String name) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userProfile =
          FirebaseFirestore.instance.collection("userdetails");
      await userProfile.doc(user.email).update({
        "username": name,
      });
      print("Data Update Successfully");
    } else {
      print("User is not authenticated.");
    }
  }

  Future<void> createNewTask(
      String selectedCategory,
      String title,
      String description,
      bool isPriorityTask,
      bool isDailyTask,
      String startDate,
      String endDate,
      String subtask,
      bool status,
      String statusList,
      String completionPercentage,
      String incompletePercentage) async {
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      CollectionReference userTask =
          FirebaseFirestore.instance.collection("userTask");

      String taskId = userTask.doc().id;
      await userTask.doc(user.email).collection("task").doc(taskId).set({
        "selected_category": selectedCategory,
        "title": title,
        "description": description,
        "is_priority_task": isPriorityTask,
        "is_daily_task": isDailyTask,
        "start_date": startDate,
        "end_date": endDate,
        "sub_tasks": subtask,
        "status": status,
        "status_list": statusList,
        "completion_percentage": completionPercentage,
        "incomplete_percentage": incompletePercentage
      });
      print("Data Saved Successfully");
    } else {
      print("User is not authenticated.");
    }
  }



  Future<Map<String, dynamic>?> getAllTask() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userTask = FirebaseFirestore.instance.collection("userTask");
      QuerySnapshot querySnapshot = await userTask.doc(user.email).collection("task").get();

      if (querySnapshot.docs.isNotEmpty) {
        Map<String, dynamic> allTasks = {};
        for (var doc in querySnapshot.docs) {
          allTasks[doc.id] = doc.data() as Map<String, dynamic>;
          print(allTasks[doc.id]);
        }
        return allTasks;
      } else {
        print("No tasks found.");
        return null;
      }
    } else {
      print("User is not authenticated.");
      return null;
    }
  }
















  Future<void> setPin(String pin) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userProfile =
          FirebaseFirestore.instance.collection("userpins");
      await userProfile.doc(user.email).set({"pin": pin});
      print("Pin Set Successfully");
    } else {
      print("User is not authenticated.");
    }
  }

  Future<bool> checkPins(String enteredPin) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      CollectionReference userProfile =
          FirebaseFirestore.instance.collection("userpins");
      DocumentSnapshot doc = await userProfile.doc(user.email).get();

      if (doc.exists) {
        if (doc["pin"] == enteredPin) {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } else {
      print("No user data found.");
      return false;
    }
  }
}
