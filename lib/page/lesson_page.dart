import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../widget/losson_box.dart';

class LossonPage extends StatefulWidget {
  const LossonPage({Key? key}) : super(key: key);

  @override
  _LossonPageState createState() => _LossonPageState();
}

class _LossonPageState extends State<LossonPage> {
  final Color cardBackgroundColor = const Color(0xff172026);
  final Color bodyTextColor = const Color(0xff51565A);
  final Color textHighlightColor = const Color(0xffEDF4F8);
  final Color primaryColor = const Color(0xff055AA3);
  final Color scaffoldBackgroundColor = const Color(0xff121517);
  final String title = 'Titulo';

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
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Poppins'),
              ),
              const Text(
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
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(12),
        child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return LessonBox(
              n: index,
              title: 'Exercícios 0${index + 1}',
            );
          },
        ),
      ),
    );
  }
}
