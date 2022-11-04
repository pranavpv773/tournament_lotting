import 'package:flutter/material.dart';
import 'package:tournament_lotter/app/constants/colors/colors.dart';
import 'widgets/login_text.dart';
import 'widgets/login_text_forms.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.height;
    MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimary,
        toolbarHeight: MediaQuery.of(context).size.height / 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(50),
            bottomLeft: Radius.circular(50),
          ),
        ),
        title: Image.asset(
          "assets/trophy_lottie.png",
          width: MediaQuery.of(context).size.width / 6,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const LoginTextforms(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: kGrey,
                    fontSize: 15,
                  ),
                ),
                const LoginTextButton(
                  text: "Register",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
