import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ImplicitAnimation2 extends StatefulWidget {
  const ImplicitAnimation2({
    Key? key,
  }) : super(key: key);

  @override
  State<ImplicitAnimation2> createState() => _ImplicitAnimation2State();
}

class _ImplicitAnimation2State extends State<ImplicitAnimation2> {
  final String title = 'Anim. implícitas Exe: 2';
  List<Map> sections = [];
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
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

  @override
  Widget build(BuildContext context) {
    num media = MediaQuery.of(context).size.height;
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
                  setState(() {
                    if (!section['selected']) {
                      for (var element in sections) {
                        if (element['selected']) {
                          element['selected'] = !element['selected'];
                        }
                      }
                    }
                    _controller.animateTo((section['n'] * 34).toDouble(),
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.linear);
                    section['selected'] = !section['selected'];
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(children: [
                        Expanded(
                            child: Text(
                          section['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: section['selected']
                                  ? Theme.of(context).primaryColor
                                  : Theme.of(context).highlightColor),
                        )),
                        AnimatedRotation(
                          turns: section['selected'] ? 0.5 : 0.0,
                          duration: const Duration(milliseconds: 250),
                          child: Icon(
                            Icons.expand_more,
                            color: section['selected']
                                ? Theme.of(context).primaryColor
                                : Theme.of(context).highlightColor,
                          ),
                        ),
                      ]),
                    ),
                    AnimatedContainer(
                      duration: const Duration(
                        milliseconds: 700,
                      ),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius: BorderRadius.circular(23)),
                      constraints: section['selected']
                          ? BoxConstraints(maxHeight: media / 1.5)
                          : const BoxConstraints(maxHeight: 0),
                      child: SingleChildScrollView(
                        physics: const ClampingScrollPhysics(),
                        child: AnimatedOpacity(
                          opacity: !section['selected'] ? 0 : 1,
                          duration: const Duration(
                            milliseconds: 700,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const FlutterLogo(
                                  size: 50,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    section['body'],
                                    textAlign: TextAlign.justify,
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
