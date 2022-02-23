import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widget/bottom_bar.dart';

class RepositoriePage extends StatefulWidget {
  const RepositoriePage({Key? key}) : super(key: key);

  @override
  _RepositoriePageState createState() => _RepositoriePageState();
}

class _RepositoriePageState extends State<RepositoriePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        toolbarHeight: 48,
        actions: [
          IconButton(
            icon: SvgPicture.asset('images/awesome_moon.svg',
                color: Theme.of(context).highlightColor,
                semanticsLabel: 'Label'),
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
                'Repositórios',
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
