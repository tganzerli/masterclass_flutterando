import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/bottom_bar.dart';

class DavPage extends StatefulWidget {
  const DavPage({Key? key}) : super(key: key);

  @override
  _DavPageState createState() => _DavPageState();
}

class _DavPageState extends State<DavPage> {
  final Color cardBackgroundColor = const Color(0xff172026);
  final Color bodyTextColor = const Color(0xff51565A);
  final Color textHighlightColor = const Color(0xffEDF4F8);
  final Color primaryColor = const Color(0xff055AA3);
  final Color scaffoldBackgroundColor = const Color(0xff121517);
  final List<Map> infoSkills = [
    {'title': 'Dart/Flutter', 'skill': 0.6},
    {'title': 'Sql', 'skill': 0.8},
    {'title': 'APEX', 'skill': 0.9},
    {'title': 'HTML / CSS', 'skill': 0.4},
  ];

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
            children: [
              Text(
                'Sobre o dev',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Poppins',
                  color: textHighlightColor,
                ),
              ),
              Text(
                'Flutterando Masterclass',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: textHighlightColor,
                ),
              )
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(14),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 320,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: cardBackgroundColor,
                      borderRadius: BorderRadius.circular(28),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 116,
                          width: 116,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(58),
                            color: scaffoldBackgroundColor,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(58),
                              child: Image.asset('images/dev.png'),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Thiago Amaral Ganzerli',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins',
                            color: textHighlightColor,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          alignment: Alignment.topCenter,
                          child: Text(
                            'Duis rhoncus dui venenatis consequat porttitor. Etiam aliquet congue consequat. In posuere, nunc sit amet laoreet blandit, urna sapien.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins',
                              color: bodyTextColor,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        SizedBox(
                          height: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset('images/whatsapp.svg',
                                  color: textHighlightColor,
                                  semanticsLabel: 'Label'),
                              const SizedBox(
                                width: 28,
                              ),
                              SvgPicture.asset('images/github_alt.svg',
                                  color: textHighlightColor,
                                  semanticsLabel: 'Label'),
                              const SizedBox(
                                width: 28,
                              ),
                              SvgPicture.asset('images/instagram.svg',
                                  color: textHighlightColor,
                                  semanticsLabel: 'Label'),
                              const SizedBox(
                                width: 28,
                              ),
                              SvgPicture.asset('images/facebook.svg',
                                  color: textHighlightColor,
                                  semanticsLabel: 'Label'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Tecnologias Favoritas',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: textHighlightColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) =>
                            const VerticalDivider(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return const FavoriteBox(
                            title: 'Flutter',
                            imageRoute: 'images/flutter.svg',
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'Habilidades e Competências',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                        color: textHighlightColor,
                      ),
                    ),
                  ),
                  SkillsBox(
                    info: infoSkills,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
          const BottomBar(
            page: 'Dev',
          ),
        ],
      ),
    );
  }
}

class FavoriteBox extends StatelessWidget {
  final Color cardBackgroundColor;
  final Color textHighlightColor;
  final String title;
  final String imageRoute;
  const FavoriteBox({
    Key? key,
    this.cardBackgroundColor = const Color(0xff172026),
    this.textHighlightColor = const Color(0xffEDF4F8),
    required this.title,
    required this.imageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 94,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageRoute,
              color: textHighlightColor,
              semanticsLabel: 'Label',
              height: 48,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: textHighlightColor,
              ),
            ),
          ]),
    );
  }
}

class SkillsBox extends StatelessWidget {
  final Color cardBackgroundColor;
  final Color scaffoldBackgroundColor;
  final Color bodyTextColor;
  final Color primaryColor;
  final List<Map> info;

  const SkillsBox({
    Key? key,
    this.cardBackgroundColor = const Color(0xff172026),
    this.scaffoldBackgroundColor = const Color(0xff121517),
    this.bodyTextColor = const Color(0xff51565A),
    this.primaryColor = const Color(0xff055AA3),
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: info.isEmpty ? 42 : (info.length * 29) + 28,
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(14),
            child: ListView.separated(
              separatorBuilder: (context, index) => const Divider(),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: info.length,
              itemBuilder: (context, index) {
                Map skill = info[index];
                double level =
                    skill.isEmpty ? 0 : ((skill['skill'].toDouble() * 250));
                return Row(
                  children: [
                    Expanded(
                        child: Text(
                      skill['title'],
                      style: TextStyle(
                        color: bodyTextColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    )),
                    Stack(
                      children: [
                        Container(
                          height: 9,
                          width: 250,
                          decoration: BoxDecoration(
                              color: scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(4.5)),
                        ),
                        Container(
                          height: 9,
                          width: level,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(4.5)),
                        )
                      ],
                    )
                  ],
                );
              },
            )),
      ),
    );
  }
}
