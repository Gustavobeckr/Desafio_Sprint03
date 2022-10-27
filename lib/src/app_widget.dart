import 'package:app_contacts/src/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/add_contact.dart';


class AppWidget extends StatelessWidget {
  static const HOME_SCREEN = '/';
  static const ADD_SCREEN = '/add_screen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      initialRoute: HOME_SCREEN,
      routes: {
        HOME_SCREEN: (context) => HomeScreen(),
        ADD_SCREEN: (context) => AddContact(),
      },
    );

  }
}
