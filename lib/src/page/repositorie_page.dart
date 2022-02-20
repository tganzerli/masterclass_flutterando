import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/bottom_bar.dart';

class RepositoriePage extends StatefulWidget {
  const RepositoriePage({Key? key}) : super(key: key);

  @override
  _RepositoriePageState createState() => _RepositoriePageState();
}

class _RepositoriePageState extends State<RepositoriePage> {
  final Color cardBackgroundColor = const Color(0xff172026);
  final Color bodyTextColor = const Color(0xff51565A);
  final Color textHighlightColor = const Color(0xffEDF4F8);
  final Color primaryColor = const Color(0xff055AA3);
  final Color scaffoldBackgroundColor = const Color(0xff121517);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: scaffoldBackgroundColor,
        toolbarHeight: 48,
        actions: [
          IconButton(
            icon: SvgPicture.asset('images/awesome_moon.svg',
                color: textHighlightColor, semanticsLabel: 'Label'),
            onPressed: () {},
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Image.asset(
            'images/logo.png',
          ),
        ),
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Repositórios',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
              Text(
                'Flutterando Masterclass',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins'),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Container(),
          const BottomBar(
            page: 'Repositorie',
          ),
        ],
      ),
    );
  }
}
