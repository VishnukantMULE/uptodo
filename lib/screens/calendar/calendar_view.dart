import 'package:flutter/material.dart';
import 'package:uptodo/screens/calendar/horizontal_calendar/horizontal_calendar_view.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_text.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.black,
        toolbarHeight: 148.0,
        title: const HorizontalCalendarView(),
      ),
      // appBar: AppBar(
      //   backgroundColor: AppColors.black,
      //   title: AppText(text: "Calendar", fontSize: 18),
      //   centerTitle: true,
      // ),
      // body: ListView(
      //   children: [Container(
      //       width: 500,
      //       height: 500,
      //       child: HorizontalCalendarView())],
      // )
    );
  }
}
