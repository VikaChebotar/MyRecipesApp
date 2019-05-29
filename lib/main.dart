import 'package:flutter/material.dart';

import 'home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Recipes',
      theme: ThemeData(
          primaryColor: Color(0xffed4b63),
          accentColor: Color(0xffed4b63),
          primaryColorDark: Color(0xffe93751),
          backgroundColor: Color(0xfffcfcfc)),
      home: MyHomePage(),
    );
  }
}
