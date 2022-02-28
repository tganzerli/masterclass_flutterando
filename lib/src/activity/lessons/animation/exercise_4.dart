import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as math;

class ControlledAnimation2 extends StatefulWidget {
  const ControlledAnimation2({
    Key? key,
  }) : super(key: key);

  @override
  State<ControlledAnimation2> createState() => _ControlledAnimation2State();
}

class _ControlledAnimation2State extends State<ControlledAnimation2>
    with SingleTickerProviderStateMixin<ControlledAnimation2> {
  final String title = 'Anim. Controladas Exe: 1';
  late ScrollController _controller;
  late AnimationController _controllerAnim;
  late Animation _iconRotate;
  late Animation _boxHeight;
  List<Map> sections = [];
  var duratino = const Duration(seconds: 1);

  @override
  void initState() {
    _controller = ScrollController();

    _controllerAnim = AnimationController(
      vsync: this,
      duration: duratino,
    );

    _iconRotate = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controllerAnim,
        curve: const Interval(0, 0.5, curve: Curves.linear),
      ),
    );

    _boxHeight = Tween<double>(begin: 0, end: (0.5)).animate(
      CurvedAnimation(
        parent: _controllerAnim,
        curve: Curves.linear,
      ),
    );

    _controllerAnim.addListener(() {
      setState(() {});
    });

    for (var i = 0; i < 50; i++) {
      var fullbody = sections.isEmpty
          ? 'Flutterando: Uma das maiores comunidade de Flutter do mundo.'
          : sections.last['body'];
      sections.add({
        'n': i,
        'title': 'My expansion tile $i',
        'body':
            'Flutterando: Uma das maiores comunidade de Flutter do mundo. $fullbody',
        'selected': false
      });
    }
    super.initState();
  }

  boxExpand(int index) {
    for (var element in sections) {
      if (element['n'] == index) {
        element['selected'] = !element['selected'];
      }
    }
    _controller.animateTo((index * 34).toDouble(),
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    _controllerAnim.forward();
  }

  boxCollapse(int index) async {
    _controllerAnim.reverse();
    await Future.delayed(duratino);
    for (var element in sections) {
      if (element['n'] == index) {
        element['selected'] = !element['selected'];
      }
    }
  }

  boxCollapseAndExpand(int index) async {
    _controllerAnim.reverse();
    await Future.delayed(duratino);
    for (var element in sections) {
      if (element['selected']) {
        element['selected'] = !element['selected'];
      }
    }
    await Future.delayed(const Duration(milliseconds: 10));
    for (var element in sections) {
      if (element['n'] == index) {
        element['selected'] = !element['selected'];
      }
    }
    _controller.animateTo((index * 34).toDouble(),
        duration: const Duration(milliseconds: 500), curve: Curves.linear);
    _controllerAnim.forward();
  }

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
        child: ListView.builder(
            controller: _controller,
            itemCount: sections.length,
            itemBuilder: (context, index) {
              var section = sections[index];
              return GestureDetector(
                  onTap: () {
                    if (!_controllerAnim.isCompleted) {
                      boxExpand(index);
                    } else {
                      if (section['selected']) {
                        boxCollapse(index);
                      } else {
                        boxCollapseAndExpand(index);
                      }
                    }
                  },
                  child: BoxTitle(
                    iconRotate: _iconRotate.value,
                    selected: section['selected'],
                    title: section['title'],
                    body: section['body'],
                    boxMaxHeight: _boxHeight.value,
                  ));
            }),
      ),
    );
  }
}

class BoxTitle extends StatelessWidget {
  final String title;
  final String body;
  final bool selected;
  final double iconRotate;
  final double boxMaxHeight;

  const BoxTitle(
      {Key? key,
      required this.title,
      required this.body,
      required this.selected,
      required this.iconRotate,
      required this.boxMaxHeight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    num media = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(children: [
            Expanded(
                child: Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selected
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).highlightColor),
            )),
            Transform.rotate(
              angle: selected ? iconRotate * math.pi : 0,
              child: Icon(
                Icons.expand_more,
                color: selected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).highlightColor,
              ),
            ),
          ]),
        ),
        Container(
          constraints: selected
              ? BoxConstraints(maxHeight: media * boxMaxHeight)
              : const BoxConstraints(maxHeight: 0),
          child: Container(
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(23)),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  const FlutterLogo(
                    size: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      body,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
