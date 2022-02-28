import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../pages/lesson_page.dart';

class LessonInfoBox extends StatelessWidget {
  final String titleText;
  final String bodyText;
  final int exercisesNumber;
  final String imageRoute;
  final List<Map> exercisesList;

  const LessonInfoBox({
    Key? key,
    required this.titleText,
    required this.bodyText,
    required this.exercisesNumber,
    required this.imageRoute,
    required this.exercisesList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              height: 43,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 43,
                    width: 43,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(21.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: SvgPicture.asset(imageRoute,
                          color: Theme.of(context).scaffoldBackgroundColor,
                          semanticsLabel: 'Label'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        titleText,
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                  ),
                  Text(
                    'Exercicios:',
                    textAlign: TextAlign.right,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                    child: Text(
                      exercisesNumber.toString(),
                      textAlign: TextAlign.right,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  bodyText,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ),
            Container(
              height: 34.5,
              padding: const EdgeInsets.symmetric(horizontal: 4.56),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('images/awesome_github.svg',
                      color: Theme.of(context).highlightColor,
                      semanticsLabel: 'Label'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.36),
                      child: Text(
                        'Acessar código fonte',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LessonPage(
                              title: titleText, exercises: exercisesList)));
                    },
                    child: Container(
                      height: 34.5,
                      width: 119,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Text(
                        'Ver mais',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
