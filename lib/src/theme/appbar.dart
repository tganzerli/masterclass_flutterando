import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool useIcon;
  final String title;
  const CustomAppBar({
    Key? key,
    this.useIcon = false,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: const Color(0xCC121517),
      toolbarHeight: 48,
      actions: [
        IconButton(
          icon: SvgPicture.asset('images/awesome_moon.svg',
              color: Theme.of(context).highlightColor, semanticsLabel: 'Label'),
          onPressed: () {},
        ),
      ],
      leading: useIcon
          ? Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Image.asset(
                'images/logo.png',
              ),
            )
          : null,
      title: Align(
        alignment: Alignment.centerLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Flutterando Masterclass',
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
