import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/cpf_model.dart';
import '../widget/custom_button.dart';

class CpfGeneratorPage extends StatefulWidget {
  const CpfGeneratorPage({Key? key}) : super(key: key);

  @override
  _CpfGeneratorPageState createState() => _CpfGeneratorPageState();
}

class _CpfGeneratorPageState extends State<CpfGeneratorPage> {
  final CpfModel cpfModel = CpfModel();
  final String title = 'Design Patterns';
  List<String> cpf = [];

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
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 105,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(26)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Gerador de CPF',
                        textAlign: TextAlign.left,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            cpf.insert(0, cpfModel.cpfGenerator());
                          });
                        },
                        child: const CustomButton(title: 'Gerar'),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: cpf.length,
                  itemBuilder: (context, index) {
                    return Container(
                        width: double.infinity,
                        height: 50,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              'CPF:',
                              textAlign: TextAlign.left,
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            Expanded(
                              child: Text(
                                cpf[index],
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                          ],
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
