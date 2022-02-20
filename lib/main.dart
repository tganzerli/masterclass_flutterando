import 'package:flutter/material.dart';
import 'package:masterclass_flutterando/src/lessons/design_patterns/lesson_4.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterando MasteClass',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cardColor: const Color(0xff172026),
        scaffoldBackgroundColor: const Color(0xff121517),
        primaryColor: const Color(0xff055AA3),
        highlightColor: const Color(0xffEDF4F8),
        textTheme: const TextTheme(
          headline1: TextStyle(
              color: Color(0xffEDF4F8),
              fontFamily: 'Poppins',
              fontSize: 20,
              fontWeight: FontWeight.w600),
          headline2: TextStyle(
              color: Color(0xffEDF4F8),
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w600),
          headline3: TextStyle(
              color: Color(0xffEDF4F8),
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w500),
          headline4: TextStyle(
              color: Color(0xffEDF4F8),
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500),
          bodyText1: TextStyle(
              color: Color(0xff51565A),
              fontFamily: 'Montserrat',
              fontSize: 14,
              fontWeight: FontWeight.w400),
          bodyText2: TextStyle(
              color: Color(0xff51565A),
              fontFamily: 'Montserrat',
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ),
      home: const Lesson4(),
      //routes: {
      // '/':(context) =>  const LessonPage(),
      // '/lesson/4/'
      //},..
    );
  }
}
