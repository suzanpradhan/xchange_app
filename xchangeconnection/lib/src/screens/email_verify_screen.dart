import 'package:flutter/material.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class EmailVerifyScreen extends StatefulWidget {
  @override
  _EmailVerifyScreenState createState() => _EmailVerifyScreenState();
}

class _EmailVerifyScreenState extends State<EmailVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    final Size _mediaSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsPalette.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Verification", style: Typograph.largeBoldTitle),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "We have sent you a verification link into your email address for email verification.",
                    style: Typograph.mediumTextGrey,
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Image.asset(
                    "assets/images/main_sent.jpg",
                    width: _mediaSize.width,
                    height: 240,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginScreen();
                        }));
                      },
                      child: Text(
                        "Back to Login",
                        style: Typograph.mediumTextWhite,
                      ),
                      color: ColorsPalette.accentRed,
                      height: 50,
                      minWidth: _mediaSize.width,
                      splashColor: ColorsPalette.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
