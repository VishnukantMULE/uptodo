import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uptodo/theme/app_colors.dart';
import 'package:uptodo/widgets/app_text.dart';

class HorizontalCalendarView extends StatefulWidget {
  const HorizontalCalendarView({super.key});

  @override
  State<HorizontalCalendarView> createState() => _HorizontalCalendarViewState();
}

class _HorizontalCalendarViewState extends State<HorizontalCalendarView> {

  int selectedIndex = 0;
  DateTime now = DateTime.now();
  late DateTime lastDayOfMonth;
  @override
  void initState() {
    super.initState();
    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(

          children: [

            Expanded(
                child: Center(child: AppText(text: "calendar", fontSize: 18))

            )
          ],
        ),
        const SizedBox(height: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          child: Row(
            children: List.generate(
              lastDayOfMonth.day,
                  (index) {
                final currentDate =
                lastDayOfMonth.add(Duration(days: index + 1));
                final dayName = DateFormat('E').format(currentDate);
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16.0 : 0.0, right: 16.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      selectedIndex = index;
                    }),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.white500)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 42.0,
                            width: 42.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? AppColors.primary
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(5.0),
                              shape: BoxShape.rectangle
                            ),
                            child: Text(
                              dayName.substring(0, 1),
                              style: TextStyle(
                                fontSize: 24.0,
                                color: selectedIndex == index
                                    ? Colors.white
                                    : AppColors.white500,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            "${index + 1}",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: AppColors.white500,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Container(
                            height: 2.0,
                            width: 28.0,
                            color: selectedIndex == index
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
