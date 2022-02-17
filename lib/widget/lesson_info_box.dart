import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LessonInfoBox extends StatelessWidget {
  final Color cardBackgroundColor;
  final Color scaffoldBackgroundColor;
  final Color primaryColor;
  final Color bodyTextColor;
  final Color textHighlightColor;

  final String titleText;
  final String bodyText;
  final int exercisesNumber;
  final String imageRoute;

  const LessonInfoBox({
    Key? key,
    this.cardBackgroundColor = const Color(0xff172026),
    this.bodyTextColor = const Color(0xff51565A),
    this.textHighlightColor = const Color(0xffEDF4F8),
    this.primaryColor = const Color(0xff055AA3),
    this.scaffoldBackgroundColor = const Color(0xff121517),
    this.titleText = 'Aula Titulo',
    this.bodyText = 'Informaçoes da aula',
    this.exercisesNumber = 0,
    this.imageRoute = 'images/material_toys.svg',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
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
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(21.5),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(imageRoute,
                          color: scaffoldBackgroundColor,
                          semanticsLabel: 'Label'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Text(
                        titleText,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: textHighlightColor,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    'Exercicios:',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      color: bodyTextColor,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(8, 0, 4, 0),
                    child: Text(
                      exercisesNumber.toString(),
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: textHighlightColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
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
                  style: TextStyle(
                    color: bodyTextColor,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
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
                      color: textHighlightColor, semanticsLabel: 'Label'),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.36),
                      child: Text(
                        'Acessar código fonte',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: textHighlightColor,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 34.5,
                    width: 119,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: Text(
                      'Ver mais',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: textHighlightColor,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
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
