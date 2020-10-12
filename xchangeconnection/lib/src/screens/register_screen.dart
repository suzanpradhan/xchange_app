import 'package:flutter/material.dart';
import 'package:xchangeconnection/api/repository/api_repo.dart';
import 'package:xchangeconnection/bloc/register/register_bloc.dart';
import 'package:xchangeconnection/src/screens/email_verify_screen.dart';
import 'package:xchangeconnection/src/widgets/custom_text_field.dart';
import 'package:xchangeconnection/utils/utilities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(ApiRepo()),
      child: RegisterScreenStateful(),
    );
  }
}

class RegisterScreenStateful extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreenStateful> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _confirmpasswordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size _mediaSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorsPalette.white,
        body: BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegistrationErrorState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error,
                  style: Typograph.mediumTextWhite,
                ),
                backgroundColor: ColorsPalette.accentRed,
              ));
            } else if (state is RegistrationFieldErrorState) {
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  state.error,
                  style: Typograph.bodyTextWhite,
                ),
                backgroundColor: ColorsPalette.accentRed,
              ));
            } else if (state is RegistrationSuccesState) {
              Navigator.of(context).popUntil((route) => route.isFirst);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) {
                return EmailVerifyScreen();
              }));
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
                          height: 60,
                        ),
                        Text("Create Account!",
                            style: Typograph.largeBoldTitle),
                        Text("Let's create an account.",
                            style: Typograph.mediumTextGrey),
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                            hintText: "Name",
                            obscureText: false,
                            isfocus: true,
                            width: _mediaSize.width,
                            textEditingController: _namecontroller,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 20,
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
                            isfocus: true,
                            width: _mediaSize.width,
                            textEditingController: _passwordcontroller,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: CustomTextField(
                            hintText: "Confirm Password",
                            obscureText: true,
                            isfocus: false,
                            width: _mediaSize.width,
                            textEditingController: _confirmpasswordcontroller,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
                          child: MaterialButton(
                              onPressed: () {
                                BlocProvider.of<RegisterBloc>(context).add(
                                    RegisterFormSubmitted(
                                        email: _emailcontroller.text,
                                        name: _namecontroller.text,
                                        password: _passwordcontroller.text,
                                        confirmPassword:
                                            _confirmpasswordcontroller.text));
                              },
                              child: Text(
                                "Register",
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
                            Navigator.pop(context);
                          },
                          child: RichText(
                              text: TextSpan(children: [
                            TextSpan(
                                text: "Already have an account? ",
                                style: Typograph.bodyTextBlack),
                            TextSpan(
                                text: "Sign In", style: Typograph.bodyTextRed)
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
