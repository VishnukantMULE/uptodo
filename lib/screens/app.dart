import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uptodo/screens/addtask/add_task_view.dart';
import 'package:uptodo/screens/calendar/calendar_view.dart';
import 'package:uptodo/screens/focuse/focus_view.dart';
import 'package:uptodo/screens/index/index_view.dart';
import 'package:uptodo/screens/profile/profile_view.dart';
import 'package:uptodo/theme/app_colors.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    const IndexView(),
    const CalendarView(),
     AddTaskView(),
    const FocusView(),
    const ProfileView()
  ];
  bool isAddTask=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: SizedBox(
      //   width: isAddTask? 80:60,
      //   height: isAddTask? 80:60,
      //   child: FloatingActionButton(
      //     onPressed: () {
      //       setState(() {
      //         _currentIndex = 2;
      //         isAddTask=true;
      //
      //       });
      //     },
      //     elevation: 1.0,
      //     shape: const CircleBorder(),
      //     backgroundColor: AppColors.primary,
      //     splashColor: AppColors.primary,
      //     child:  ClipOval(
      //       child: Icon(
      //         Icons.add,
      //         color: AppColors.white,
      //         size:isAddTask? 60:40,
      //       ),
      //     ),
      //   ),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // backgroundColor: AppColors.black,
        backgroundColor: AppColors.black,

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            isAddTask=false;

          });
        },
        showSelectedLabels: false,
        showUnselectedLabels: false,
        unselectedLabelStyle: const TextStyle(
          fontSize: 20,
          color: AppColors.black
        ),
        selectedLabelStyle: const TextStyle(
          color: Colors.white
        ),
        unselectedIconTheme:
            const IconThemeData(color: AppColors.white500, size: 30),
        selectedIconTheme:
            const IconThemeData(color: AppColors.white, size: 40),
        items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded), label: 'index'),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month), label: 'calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,), label: ''),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.clock), label: 'focus'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.person), label: 'profile'),
        ],
      ),
    );
  }
}
