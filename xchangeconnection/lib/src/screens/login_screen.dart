import 'package:flutter/material.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/bloc/login/login_bloc.dart';
import 'package:xchangeconnection/src/screens/home_screen.dart';
import 'package:xchangeconnection/src/screens/register_screen.dart';
import 'package:xchangeconnection/src/widgets/custom_text_field.dart';
import 'package:xchangeconnection/utils/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(ApiRepo()),
      child: LoginScreenStateful(),
    );
  }
}

class LoginScreenStateful extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreenStateful> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorsPalette.white,
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginErrorState) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.errors,
                    style: Typograph.bodyTextWhite,
                  ),
                  backgroundColor: ColorsPalette.accentRed,
                ),
              );
            } else if (state is LoginVerifiedState) {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          HomeScreen(state.loginModel.user_id)));
            } else if (state is LoginFieldErrorState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error,
                  style: Typograph.bodyTextWhite,
                ),
                backgroundColor: ColorsPalette.accentRed,
              ));
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        Text("Welcome Back!", style: Typograph.largeBoldTitle),
                        Text("Sign in to continue.",
                            style: Typograph.mediumTextGrey),
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                            hintText: "Email",
                            obscureText: false,
                            isfocus: true,
                            width: _mediaSize.width,
                            textEditingController: _emailcontroller,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                            hintText: "Password",
                            obscureText: true,
                            isfocus: false,
                            width: _mediaSize.width,
                            textEditingController: _passwordController,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
                          child: MaterialButton(
                              onPressed: () {
                                BlocProvider.of<LoginBloc>(context).add(
                                    LoginFormSubmitted(
                                        email: _emailcontroller.text,
                                        password: _passwordController.text));
                              },
                              child: Text(
                                "Login",
                                style: Typograph.mediumTextWhite,
                              ),
                              color: ColorsPalette.accentRed,
                              height: 50,
                              minWidth: _mediaSize.width,
                              splashColor: ColorsPalette.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8))),
                        ),
                        InkWell(
                          highlightColor: ColorsPalette.white,
                          focusColor: ColorsPalette.white,
                          splashColor: ColorsPalette.white,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RegisterScreen()));
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Don't have an account? ",
                                style: Typograph.bodyTextBlack),
                            TextSpan(
                                text: "Sign Up", style: Typograph.bodyTextRed)
                          ])),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
