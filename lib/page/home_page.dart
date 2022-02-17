import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/lesson_info_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color scaffoldBackgroundColor = const Color(0xff121517);
  final Color primaryColor = const Color(0xffEDF4F8);

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
                color: primaryColor, semanticsLabel: 'Label'),
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
          SafeArea(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 46,
                width: double.infinity,
                alignment: Alignment.bottomCenter,
              ),
            ),
          )
        ],
      ),
    );
  }
}
