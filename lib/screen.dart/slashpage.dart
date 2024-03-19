// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'package:newwhost/screen.dart/bottomScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    waitForThreeSeconds();
    super.initState();
  }

  waitForThreeSeconds() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return BottomNavigation();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            Color.fromRGBO(1, 18, 52, 1),
            Color.fromRGBO(5, 44, 134, 1),
          ])),
      child: Center(
        child: Image.asset(
          'assets/spashimage.jpg',
          height: 300,
        ),
      ),
    );
  }
}
