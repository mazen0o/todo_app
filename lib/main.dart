import 'package:flutter/material.dart';
import 'package:todo_app/layout/home_layout.dart';
import 'package:todo_app/shared/styles/my_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeLayout.routeName: (context) => HomeLayout(),
      },
      initialRoute: HomeLayout.routeName,
      theme: MyTheme.lightTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
