import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/losson_box.dart';

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
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 48,
        actions: [
          IconButton(
            icon: SvgPicture.asset('images/awesome_moon.svg',
                color: Theme.of(context).highlightColor,
                semanticsLabel: 'Label'),
            onPressed: () {},
          ),
        ],
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(
                'Flutterando Masterclass',
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
      ),
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
