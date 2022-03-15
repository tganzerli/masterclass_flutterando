import 'package:flutter/material.dart';

class CustomTodoTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  final String? initialText;
  final bool necessary;
  final double heightFilde;
  final Color? color;

  const CustomTodoTextField({
    Key? key,
    this.controller,
    this.hint = '',
    this.obscure = false,
    this.textInputType,
    this.onChanged,
    this.enabled,
    this.initialText,
    this.necessary = false,
    this.heightFilde = 80,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightFilde,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: color ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.2),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        initialValue: initialText,
        style: Theme.of(context).textTheme.headline3,
        maxLines: 3,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: Theme.of(context).textTheme.bodyText1,
          border: InputBorder.none,
        ),
        textAlignVertical: TextAlignVertical.top,
        textAlign: TextAlign.left,
      ),
    );
  }
}
