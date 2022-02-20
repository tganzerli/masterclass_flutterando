import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff121517),
      height: double.infinity,
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset('images/masterclass_logo.png'),
      ),
    );
  }
}
