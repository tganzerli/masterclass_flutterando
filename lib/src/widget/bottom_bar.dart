import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomBar extends StatelessWidget {
  final Color cardBackgroundColor;
  final Color primaryColor;
  final Color textHighlightColor;
  final Color bottonBarBackgroundColor;
  final String page;

  const BottomBar({
    Key? key,
    this.cardBackgroundColor = const Color(0xff172026),
    this.primaryColor = const Color(0xff055AA3),
    this.textHighlightColor = const Color(0xffEDF4F8),
    this.bottonBarBackgroundColor = const Color(0xE6121517),
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool selectedIcon1 = false;
    bool selectedIcon2 = false;
    bool selectedIcon3 = false;

    if (page == 'Home') {
      selectedIcon1 = true;
    } else if (page == 'Dev') {
      selectedIcon3 = true;
    } else if (page == 'Repositorie') {
      selectedIcon2 = true;
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 86,
        color: bottonBarBackgroundColor,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 46,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: IconBox(
                  textHighlightColor: textHighlightColor,
                  title: 'Atividades',
                  cardBackgroundColor: cardBackgroundColor,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset('images/feather_target.svg',
                          color: textHighlightColor, semanticsLabel: 'Label'),
                    ),
                  ),
                  selected: selectedIcon1,
                ),
              ),
              Container(
                color: textHighlightColor,
                width: 0.8,
              ),
              Expanded(
                child: IconBox(
                  textHighlightColor: textHighlightColor,
                  title: 'Repositórios',
                  cardBackgroundColor: cardBackgroundColor,
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset('images/awesome_github.svg',
                          color: textHighlightColor, semanticsLabel: 'Label'),
                    ),
                  ),
                  selected: selectedIcon2,
                ),
              ),
              Container(
                color: textHighlightColor,
                width: 0.8,
              ),
              Expanded(
                child: IconBox(
                  textHighlightColor: textHighlightColor,
                  title: 'Sobre o dev',
                  cardBackgroundColor: cardBackgroundColor,
                  icon: Icon(
                    Icons.person,
                    size: 26,
                    color: textHighlightColor,
                  ),
                  selected: selectedIcon3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconBox extends StatelessWidget {
  final String title;
  final Color textHighlightColor;
  final Color cardBackgroundColor;
  final Widget icon;
  final bool selected;

  const IconBox({
    Key? key,
    required this.title,
    required this.textHighlightColor,
    required this.cardBackgroundColor,
    required this.icon,
    this.selected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
            width: 59,
            height: 28,
            decoration: BoxDecoration(
                color: selected ? cardBackgroundColor : Colors.transparent,
                borderRadius: BorderRadius.circular(10)),
            //child: Padding(
            //padding: const EdgeInsets.symmetric(vertical: 2),
            child: icon),
        const SizedBox(
          height: 4,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textHighlightColor,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ]),
    );
  }
}
