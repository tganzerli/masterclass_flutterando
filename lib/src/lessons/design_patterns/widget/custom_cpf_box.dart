import 'package:flutter/material.dart';

class CustomCpfBox extends StatelessWidget {
  final bool icon;
  final String cpf;
  final bool valid;
  const CustomCpfBox({
    Key? key,
    required this.icon,
    required this.cpf,
    required this.valid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 15,
            ),
            Text(
              'CPF:',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: Text(
                cpf,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
            icon
                ? (valid
                    ? const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      )
                    : const Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ))
                : const SizedBox(
                    width: 0,
                  ),
            const SizedBox(
              width: 15,
            ),
          ],
        ));
  }
}
