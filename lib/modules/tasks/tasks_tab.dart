import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/tasks/task_item.dart';

import '../../shared/styles/my_theme.dart';

class TasksTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor: Colors.blueGrey,
            dayColor: Colors.blueGrey,
            activeDayColor: Colors.white,
            activeBackgroundDayColor: MyTheme.primaryColor,
            dotsColor: Colors.white,
            // selectableDayPredicate: (date) => date.day != 23,
            locale: 'en_ISO',
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => TaskItem(),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
