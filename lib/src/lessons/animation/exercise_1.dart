import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImplicitAnimation1 extends StatefulWidget {
  const ImplicitAnimation1({
    Key? key,
  }) : super(key: key);

  @override
  State<ImplicitAnimation1> createState() => _ImplicitAnimation1State();
}

class _ImplicitAnimation1State extends State<ImplicitAnimation1> {
  final String title = 'Anim. implícitas Exe: 1';
  bool selected = false;

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
        title: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
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
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          child: AnimatedAlign(
              alignment: selected ? Alignment.topCenter : Alignment.bottomRight,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: AnimatedContainer(
                    height: selected ? 50 : 50,
                    width: selected ? 100 : 50,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius:
                            selected ? null : BorderRadius.circular(25)),
                  ))),
        ),
      ),
    );
  }
}
