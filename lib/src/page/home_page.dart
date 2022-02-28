import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../activity/pages/activity_page.dart';
import '../repositorie/pages/repositorie_page.dart';
import '../theme/appbar.dart';
import '../widget/bottom_bar.dart';
import '../dev/pages/dav_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Map> _pages = <Map>[
    {'title': 'Atividades', 'page': const ActivityPage()},
    {'title': 'Repositorio', 'page': const RepositoriePage()},
    {'title': 'Sobre o Dev', 'page': const DavPage()},
  ];

  @override
  Widget build(BuildContext context) {
    Map _page = _pages[_selectedIndex];
    return Scaffold(
      appBar: CustomAppBar(
        title: _page['title'],
        useIcon: true,
      ),
      body: Center(
        child: _page['page'],
      ),
      bottomNavigationBar: Container(
        height: 86,
        color: const Color(0xE6121517),
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.only(top: 5),
        child: Container(
          height: 46,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
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
                    selected: _selectedIndex == 0,
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
                    setState(() {
                      _selectedIndex = 1;
                    });
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
                    selected: _selectedIndex == 1,
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
                    setState(() {
                      _selectedIndex = 2;
                    });
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
                    selected: _selectedIndex == 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
