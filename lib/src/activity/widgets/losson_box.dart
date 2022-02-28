import 'package:flutter/material.dart';

class LessonBox extends StatelessWidget {
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
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(28)),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          width: 33,
          height: 33,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(16.5)),
          child: Text(
            '$numero',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
        )
      ]),
    );
  }
}
