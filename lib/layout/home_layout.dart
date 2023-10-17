import 'package:flutter/material.dart';
import 'package:todo_app/modules/settings/settings_tab.dart';
import 'package:todo_app/modules/tasks/tasks_tab.dart';

import '../modules/bottom_sheet_screen.dart';

class HomeLayout extends StatefulWidget {
  static final String routeName = "home_layout";

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To Do App",
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          onTap: (index) {
            currentIndex = index;
            setState(() {});
          },
          currentIndex: currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list, size: 40),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  size: 40,
                ),
                label: ""),
          ],
        ),
      ),
      body: tabs[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ShowBottomSheet();
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }

  List<Widget> tabs = [TasksTab(), SettingsTab()];

  ShowBottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return BottomSheetScreen();
        });
  }
}
