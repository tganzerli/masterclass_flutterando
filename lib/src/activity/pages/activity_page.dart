import 'package:flutter/material.dart';
import '../models/lessons_model.dart';
import '../widgets/lesson_info_box.dart';

class ActivityPage extends StatefulWidget {
  const ActivityPage({Key? key}) : super(key: key);

  @override
  _ActivityPageState createState() => _ActivityPageState();
}

class _ActivityPageState extends State<ActivityPage> {
  final LessonsModel lessonsModel = LessonsModel();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.all(12),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(),
        itemCount: lessonsModel.lissons.length,
        itemBuilder: (context, index) {
          Map lesson = lessonsModel.lissons[index];
          return LessonInfoBox(
            titleText: lesson['name'],
            imageRoute: lesson['icon'],
            bodyText: lesson['info'],
            exercisesNumber: lessonsModel.numberOfExercises(lesson['name']),
            exercisesList: lessonsModel.exercisesList(lesson['name']),
          );
        },
      ),
    );
  }
}
