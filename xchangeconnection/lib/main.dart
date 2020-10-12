import 'package:flutter/material.dart';
import 'package:xchangeconnection/src/screens/create_listings.dart';
import 'package:xchangeconnection/src/screens/email_verify_screen.dart';
import 'package:xchangeconnection/src/screens/home_screen.dart';
import 'package:xchangeconnection/src/screens/listing_info_page.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/src/screens/manage_profile_screen.dart';
import 'package:xchangeconnection/src/screens/create_listings.dart';
import 'package:xchangeconnection/src/screens/splash_screen.dart';
import 'package:xchangeconnection/src/widgets/listing_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SplashScreen());
  }
}
