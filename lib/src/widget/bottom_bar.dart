import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:masterclass_flutterando/src/page/home_page.dart';
import '../dev/pages/dav_page.dart';
import '../repositorie/pages/repositorie_page.dart';

class BottomBar extends StatelessWidget {
  final Color bottonBarBackgroundColor;
  final String page;

  const BottomBar({
    Key? key,
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

    return /*Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 86,
        color: bottonBarBackgroundColor,
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 5),
        child:*/
        Container(
      height: 46,
      width: double.infinity,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!selectedIcon1) {
                  Navigator.of(context).pushAndRemoveUntil(
                      _createRoute(const HomePage()), (route) => false);
                }
              },
              child: IconBox(
                textHighlightColor: Theme.of(context).highlightColor,
                title: 'Atividades',
                cardBackgroundColor: Theme.of(context).cardColor,
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('images/feather_target.svg',
                        color: Theme.of(context).highlightColor,
                        semanticsLabel: 'Label'),
                  ),
                ),
                selected: selectedIcon1,
              ),
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).highlightColor,
            thickness: 0.8,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!selectedIcon2) {
                  Navigator.of(context).pushAndRemoveUntil(
                      _createRoute(const RepositoriePage()), (route) => false);
                }
              },
              child: IconBox(
                textHighlightColor: Theme.of(context).highlightColor,
                title: 'Repositórios',
                cardBackgroundColor: Theme.of(context).cardColor,
                icon: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Align(
                    alignment: Alignment.center,
                    child: SvgPicture.asset('images/awesome_github.svg',
                        color: Theme.of(context).highlightColor,
                        semanticsLabel: 'Label'),
                  ),
                ),
                selected: selectedIcon2,
              ),
            ),
          ),
          VerticalDivider(
            color: Theme.of(context).highlightColor,
            thickness: 0.8,
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (!selectedIcon3) {
                  Navigator.of(context).pushAndRemoveUntil(
                      _createRoute(const DavPage()), (route) => false);
                }
              },
              child: IconBox(
                textHighlightColor: Theme.of(context).highlightColor,
                title: 'Sobre o dev',
                cardBackgroundColor: Theme.of(context).cardColor,
                icon: Icon(
                  Icons.person,
                  size: 26,
                  color: Theme.of(context).highlightColor,
                ),
                selected: selectedIcon3,
              ),
            ),
          ),
        ],
      ),
      /*),
      ),
    */
    );
  }

  Route _createRoute(page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
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
