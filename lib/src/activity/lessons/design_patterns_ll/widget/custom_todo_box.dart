import 'package:flutter/material.dart';

class CustomTodoBox extends StatelessWidget {
  final String title;
  final bool isChecked;
  const CustomTodoBox({
    Key? key,
    required this.title,
    this.isChecked = false,
  }) : super(key: key);

  wasDone() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      constraints: const BoxConstraints(minHeight: 40),
      alignment: Alignment.center,
      padding: const EdgeInsets.fromLTRB(10, 2.5, 20, 2.5),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(children: [
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Theme.of(context).cardColor,
                border: Border.all(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: 3.5,
                ),
              ),
            ),
            isChecked
                ? Icon(
                    Icons.check,
                    color: Theme.of(context).primaryColor,
                  )
                : const SizedBox()
          ]),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: const Color(0xffEDF4F8),
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  decoration: isChecked ? TextDecoration.lineThrough : null),
            ),
          ),
        ],
      ),
    );
  }
}
