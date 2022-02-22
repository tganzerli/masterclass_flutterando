import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../stores/cpf_validate_store.dart';
import '../widget/custom_button.dart';
import '../widget/custom_cpf_box.dart';
import '../widget/custom_text_field.dart';

class CpfValidatePage extends StatefulWidget {
  const CpfValidatePage({Key? key}) : super(key: key);

  @override
  _CpfValidatePageState createState() => _CpfValidatePageState();
}

class _CpfValidatePageState extends State<CpfValidatePage> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  final CpfValidateStore cpfValidateStore = CpfValidateStore();
  final String title = 'Design Patterns';
  var controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    cpfValidateStore.addListener(() {
      if (!cpfValidateStore.getWrongCPF()) {
        listKey.currentState!
            .insertItem(0, duration: const Duration(milliseconds: 500));
      }
      controller.clear();
      setState(() {});
    });
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
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 155,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(26)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      !cpfValidateStore.getWrongCPF()
                          ? Text(
                              'Validador de CPF',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline2,
                            )
                          : const Text(
                              'CPF invalido',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        controller: controller,
                        hint: 'Digite o CPF',
                        onChanged: cpfValidateStore.setCpf,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      GestureDetector(
                        onTap: cpfValidateStore.cpfValidate,
                        child: const CustomButton(title: 'Gerar'),
                      ),
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: AnimatedList(
                  key: listKey,
                  initialItemCount: cpfValidateStore.getCpfList().length,
                  itemBuilder: (context, index, animation) {
                    Map cpfMap = cpfValidateStore.getCpfList()[index];
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(-1, 0),
                        end: const Offset(0, 0),
                      ).animate(animation),
                      child: Container(
                        height: 50,
                        alignment: Alignment.center,
                        child: CustomCpfBox(
                          cpf: cpfMap['cpf'],
                          icon: true,
                          valid: cpfMap['valid'],
                        ),
                      ),
                    ); // Refer step 3
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
