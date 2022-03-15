import 'package:flutter/material.dart';

class CustomTodoButton extends StatelessWidget {
  final String title;
  final bool selected;
  final Function() onTap;
  const CustomTodoButton({
    Key? key,
    required this.title,
    this.selected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: selected
              ? Theme.of(context).primaryColor
              : Theme.of(context).cardColor,
        ),
        child: Align(
            alignment: Alignment.center,
            child: Text(title,
                style: selected
                    ? Theme.of(context).textTheme.headline3
                    : Theme.of(context).textTheme.bodyText1)),
      ),
    );
  }
}
