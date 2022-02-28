import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ControlledAnimation1 extends StatefulWidget {
  const ControlledAnimation1({
    Key? key,
  }) : super(key: key);

  @override
  State<ControlledAnimation1> createState() => _ControlledAnimation1State();
}

class _ControlledAnimation1State extends State<ControlledAnimation1>
    with SingleTickerProviderStateMixin<ControlledAnimation1> {
  final String title = 'Anim. Controladas Exe: 1';
  late AnimationController _controller;
  late Animation moveBorderRadius;
  late Animation moveAlignment;
  late Animation moveWidth;

  @override
  void initState() {
    var duratino = const Duration(seconds: 3);

    _controller = AnimationController(
      vsync: this,
      duration: duratino,
    );

    moveWidth = Tween<double>(begin: 50, end: 100).animate(_controller);
    moveBorderRadius = Tween<double>(begin: 25, end: 0).animate(_controller);
    moveAlignment =
        AlignmentTween(begin: Alignment.bottomRight, end: Alignment.topCenter)
            .animate(CurvedAnimation(
                parent: _controller,
                curve: const Interval(0, 0.9, curve: Curves.decelerate)));

    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
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
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(40),
          child: AnimatedAlign(
              alignment: moveAlignment.value,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: GestureDetector(
                  onTap: () {
                    if (_controller.isCompleted) {
                      _controller.reverse();
                    } else {
                      _controller.forward();
                    }
                  },
                  child: AnimatedContainer(
                    height: 50,
                    width: moveWidth.value,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastOutSlowIn,
                    decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius:
                            BorderRadius.circular(moveBorderRadius.value)),
                  ))),
        ),
      ),
    );
  }
}
