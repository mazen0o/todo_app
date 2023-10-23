import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/modules/tasks/task_item.dart';
import 'package:todo_app/utils/my_data_base.dart';

import '../../models/task_model/task_model.dart';
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
            child: StreamBuilder<QuerySnapshot<TaskModel>>(
              stream: MyDataBase.getAllTasksStream(),
              builder: (
                context,
                snapshot,
              ) {
                if (snapshot.hasError) {
                  return Text("something went error");
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                var data = snapshot.data?.docs.map((e) => e.data()).toList();
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return TaskItem(data[index]);
                  },
                  itemCount: data!.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
// ListView.builder(
// itemBuilder: (context, index) => TaskItem(),
// itemCount: 20,
// ),