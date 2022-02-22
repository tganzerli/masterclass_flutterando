import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../model/lessons_model.dart';
import '../widget/bottom_bar.dart';
import '../widget/lesson_info_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final LessonsModel lessonsModel = LessonsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
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
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Image.asset(
            'images/logo.png',
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Atividades',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
              Text(
                'Flutterando Masterclass',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(
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
                  exercisesNumber:
                      lessonsModel.numberOfExercises(lesson['name']),
                  exercisesList: lessonsModel.exercisesList(lesson['name']),
                );
              },
            ),
          ),
          const BottomBar(
            page: 'Home',
          ),
        ],
      ),
    );
  }
}
