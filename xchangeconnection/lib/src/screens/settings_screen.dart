import 'package:flutter/material.dart';
import 'package:xchangeconnection/src/screens/change_password_page.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/utils/constants/typograph.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class SettinsgsScreen extends StatefulWidget {
  final String userID;
  SettinsgsScreen({this.userID});
  @override
  _SettinsgsScreenState createState() => _SettinsgsScreenState();
}

class _SettinsgsScreenState extends State<SettinsgsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: ColorsPalette.blackGrey,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: ColorsPalette.blackGrey),
        ),
        backgroundColor: ColorsPalette.white,
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return ChangePasswordPage(
                  userID: widget.userID,
                );
              }));
            },
            child: ListTile(
              title: Text(
                "Change Password",
                style: Typograph.bodyTextBlackGrey,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return LoginScreen();
              }));
            },
            child: ListTile(
              title: Text(
                "Log Out",
                style: Typograph.bodyTextRed,
              ),
            ),
          )
        ],
      ),
    );
  }
}
