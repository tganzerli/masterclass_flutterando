import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../model/dev_model.dart';
import '../widget/bottom_bar.dart';

class DavPage extends StatefulWidget {
  const DavPage({Key? key}) : super(key: key);

  @override
  _DavPageState createState() => _DavPageState();
}

class _DavPageState extends State<DavPage> {
  DevModel devModel = DevModel();

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
                'Sobre o dev',
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
                      color: Theme.of(context).cardColor,
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
                            color: Theme.of(context).scaffoldBackgroundColor,
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
                          devModel.name,
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 70,
                          alignment: Alignment.topCenter,
                          child: Text(devModel.about,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1),
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
                                  color: Theme.of(context).highlightColor,
                                  semanticsLabel: 'Label'),
                              const SizedBox(
                                width: 28,
                              ),
                              SvgPicture.asset('images/github_alt.svg',
                                  color: Theme.of(context).highlightColor,
                                  semanticsLabel: 'Label'),
                              const SizedBox(
                                width: 28,
                              ),
                              SvgPicture.asset('images/instagram.svg',
                                  color: Theme.of(context).highlightColor,
                                  semanticsLabel: 'Label'),
                              const SizedBox(
                                width: 28,
                              ),
                              SvgPicture.asset('images/facebook.svg',
                                  color: Theme.of(context).highlightColor,
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
                      style: Theme.of(context).textTheme.headline3,
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
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  SkillsBox(
                    info: devModel.infoSkills,
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
  final String title;
  final String imageRoute;
  const FavoriteBox({
    Key? key,
    required this.title,
    required this.imageRoute,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 94,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              imageRoute,
              color: Theme.of(context).highlightColor,
              semanticsLabel: 'Label',
              height: 48,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline4,
            ),
          ]),
    );
  }
}

class SkillsBox extends StatelessWidget {
  final List<Map> info;

  const SkillsBox({
    Key? key,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: info.isEmpty ? 42 : (info.length * 29) + 28,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
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
                      style: Theme.of(context).textTheme.bodyText2,
                    )),
                    Stack(
                      children: [
                        Container(
                          height: 9,
                          width: 250,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(4.5)),
                        ),
                        Container(
                          height: 9,
                          width: level,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
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
