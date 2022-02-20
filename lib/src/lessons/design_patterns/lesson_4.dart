import 'package:flutter/material.dart';
import 'package:masterclass_flutterando/src/lessons/design_patterns/page/exercise_2.dart';
import 'package:masterclass_flutterando/src/page/lesson_page.dart';

class Lesson4 extends StatefulWidget {
  const Lesson4({Key? key}) : super(key: key);

  @override
  _Lesson4State createState() => _Lesson4State();
}

class _Lesson4State extends State<Lesson4> {
  @override
  Widget build(BuildContext context) {
    return const LessonPage(
      title: 'Design Patterns',
      exercises: [
        {'title': 'Gerador de CPF', 'nameclass': CpfGeneratorPage()}
      ],
    );
  }
}
