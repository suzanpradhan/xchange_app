import 'dart:async';

import 'package:flutter/material.dart';
import 'package:xchangeconnection/src/screens/home_screen.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/utils/connectivity.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return HomeScreen(null);
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPalette.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Image.asset(
                "assets/images/logo.png",
                height: 80,
                width: 250,
              ),
            ),
            CircularProgressIndicator(
              backgroundColor: ColorsPalette.white,
              valueColor: AlwaysStoppedAnimation(ColorsPalette.accentRed),
            )
          ],
        ),
      ),
    );
  }
}
