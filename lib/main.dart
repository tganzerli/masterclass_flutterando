import 'package:flutter/material.dart';
import 'package:masterclass_flutterando/page/lesson_page.dart';

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
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LossonPage(),
    );
  }
}
