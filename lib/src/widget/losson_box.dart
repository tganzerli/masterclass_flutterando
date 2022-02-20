import 'package:flutter/material.dart';

class LessonBox extends StatelessWidget {
  final Color cardBackgroundColor = const Color(0xff172026);
  final Color textHighlightColor = const Color(0xffEDF4F8);
  final Color primaryColor = const Color(0xff055AA3);
  final int n;
  final String title;

  const LessonBox({
    Key? key,
    required this.n,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numero = n + 1;
    return Container(
      height: 62,
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
          color: cardBackgroundColor, borderRadius: BorderRadius.circular(28)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 33,
          height: 33,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: primaryColor, borderRadius: BorderRadius.circular(16.5)),
          child: Text(
            '$numero',
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: textHighlightColor),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: textHighlightColor),
            ),
          ),
        )
      ]),
    );
  }
}
