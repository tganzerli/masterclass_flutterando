import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/bottom_bar.dart';
import '../widget/lesson_info_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                'Atividades',
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
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.all(12),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 4,
              itemBuilder: (context, index) {
                return LessonInfoBox(
                  titleText: 'Titulo da aula $index',
                );
              },
            ),
          ),
          const BottomBar(
            page: 'Home',
          ),
        ],
      ),
    );
  }
}
