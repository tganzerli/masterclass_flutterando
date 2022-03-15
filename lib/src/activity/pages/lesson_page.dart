import 'package:flutter/material.dart';
import 'package:masterclass_flutterando/src/activity/widgets/losson_box.dart';
import 'package:masterclass_flutterando/src/theme/appbar.dart';

class LessonPage extends StatefulWidget {
  final String title;
  final List<Map> exercises;
  const LessonPage({
    Key? key,
    required this.title,
    required this.exercises,
  }) : super(key: key);

  @override
  _LessonPageState createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: CustomAppBar(title: widget.title),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: widget.exercises.length,
          itemBuilder: (context, index) {
            Map exercise = widget.exercises[index];
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => exercise['nameclass']));
              },
              child: LessonBox(
                n: index,
                title: exercise['title'],
              ),
            );
          },
        ),
      ),
    );
  }
}
