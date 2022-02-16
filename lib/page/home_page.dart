import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color backgroundColor = const Color(0xff121517);
  final Color primaryColor = const Color(0xffEDF4F8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
      body: SafeArea(
        minimum: const EdgeInsets.all(10.0),
        child: Container(),
      ),
    );
  }
}
