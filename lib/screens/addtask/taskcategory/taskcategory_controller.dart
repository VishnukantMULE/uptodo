
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uptodo/screens/addtask/taskcategory/taskcategort_model.dart';

import 'category_list_model.dart';

class TaskcategoryController extends GetxController{
  final TaskcategortModel taskcategortModel=TaskcategortModel();
  List<CategoryListModel> items = [
    CategoryListModel(icon: Icons.local_grocery_store, title: 'grocery'),
    CategoryListModel(icon: Icons.work, title: 'work'),
    CategoryListModel(icon: Icons.sports, title: 'sport'),
    CategoryListModel(icon: Icons.design_services, title: 'design'),
    CategoryListModel(icon: Icons.school, title: 'University'),
    CategoryListModel(icon: Icons.child_friendly_sharp, title: 'Social'),
    CategoryListModel(icon: Icons.multitrack_audio_sharp, title: 'Music'),
    CategoryListModel(icon: Icons.health_and_safety, title: 'Health'),
    CategoryListModel(icon: Icons.movie_filter_sharp, title: 'Movies'),
    CategoryListModel(icon: Icons.home, title: 'Home'),
    CategoryListModel(icon: Icons.garage, title: 'Garbage'),
    CategoryListModel(icon: Icons.cleaning_services, title: 'Cleaning'),
    CategoryListModel(icon: Icons.local_laundry_service, title: 'Laundry'),
    CategoryListModel(icon: Icons.travel_explore_rounded, title: 'Travel'),
    CategoryListModel(icon: Icons.volunteer_activism, title: 'Volunteering'),
    CategoryListModel(icon: Icons.self_improvement, title: 'Self Care'),
    CategoryListModel(icon: Icons.menu_book, title: 'Reading'),
    CategoryListModel(icon: Icons.edit_note, title: 'Writing'),
    CategoryListModel(icon: Icons.pets, title: 'Pet Care'),
    CategoryListModel(icon: Icons.car_crash, title: 'Car '),
    CategoryListModel(icon: Icons.email, title: 'Email'),
    CategoryListModel(icon: Icons.group, title: 'Meeting'),
    CategoryListModel(icon: Icons.network_wifi, title: 'Networking'),
    CategoryListModel(icon: Icons.find_in_page_rounded, title: 'Research'),
    CategoryListModel(icon: Icons.temple_hindu, title: 'Temple'),
    CategoryListModel(icon: Icons.shopping_bag_outlined, title: 'Shopping'),
    CategoryListModel(icon: Icons.photo_camera, title: 'Photography'),
    CategoryListModel(icon: Icons.video_settings, title: 'Video Editing'),


  ];

}