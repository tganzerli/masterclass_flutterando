import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  final String? initialText;
  final bool necessary;
  final double heightFilde;
  final Color? color;

  const CustomTextField({
    Key? key,
    this.controller,
    this.hint = '',
    this.prefix,
    this.suffix,
    this.obscure = false,
    this.textInputType,
    this.onChanged,
    this.enabled,
    this.initialText,
    this.necessary = false,
    this.heightFilde = 35,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: heightFilde,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: color ?? Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(32),
        ),
        padding: prefix != null ? null : const EdgeInsets.only(left: 16),
        child: TextFormField(
          controller: controller,
          obscureText: obscure,
          keyboardType: textInputType,
          onChanged: onChanged,
          enabled: enabled,
          initialValue: initialText,
          style: Theme.of(context).textTheme.headline3,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: Theme.of(context).textTheme.bodyText1,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon: suffix,
          ),
          textAlignVertical: TextAlignVertical.center,
          textAlign: TextAlign.center,
        ),
      ),
    ]);
  }
}
