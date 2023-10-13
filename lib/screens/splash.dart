import 'dart:async';

import 'package:flutter/material.dart';
import 'package:telegram_project/screens/home.dart';
import 'package:telegram_project/screens/login.dart';

import '../main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {
      bool isLoggedIn = sharedPreferences.getBool('isLoggedIn') ?? false;

      if (isLoggedIn) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>  HomeScreen()));
      } else {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginScreen()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/image/312af9235aadad69655688eaee97eabf.jpg',
          height: 100,
        ),
      ),
    );
  }
}