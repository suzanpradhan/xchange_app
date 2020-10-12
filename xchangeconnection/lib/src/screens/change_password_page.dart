import 'package:flutter/material.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/src/screens/login_screen.dart';
import 'package:xchangeconnection/src/widgets/custom_text_field.dart';
import 'package:xchangeconnection/utils/utilities.dart';

class ChangePasswordPage extends StatefulWidget {
  final String userID;
  ChangePasswordPage({this.userID});
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  TextEditingController _oldPassword = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
          "Change Password",
          style: TextStyle(color: ColorsPalette.blackGrey),
        ),
        backgroundColor: ColorsPalette.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  hintText: "Old Password",
                  isfocus: true,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  width: MediaQuery.of(context).size.width,
                  textEditingController: _oldPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  hintText: "New Password",
                  isfocus: true,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  width: MediaQuery.of(context).size.width,
                  textEditingController: _newPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextField(
                  hintText: "Confirm New Password",
                  isfocus: true,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  width: MediaQuery.of(context).size.width,
                  textEditingController: _confirmPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
                child: MaterialButton(
                    onPressed: () {
                      (_newPassword.text == _confirmPassword.text)
                          ? ApiRepo()
                              .changePassword(_newPassword.text,
                                  _oldPassword.text, widget.userID)
                              .then((value) {
                              _scaffoldKey.currentState
                                  .showSnackBar(SnackBar(content: Text(value)));
                            })
                          : _scaffoldKey.currentState.showSnackBar(SnackBar(
                              content:
                                  Text("Confirm Password should be same.")));
                    },
                    child: Text(
                      "Change Password",
                      style: Typograph.mediumTextWhite,
                    ),
                    color: ColorsPalette.accentRed,
                    height: 50,
                    minWidth: MediaQuery.of(context).size.width,
                    splashColor: ColorsPalette.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
