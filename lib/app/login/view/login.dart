import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/get_start/view/get_start.dart';
import 'package:git_app/app/signUp/view/signup_screen.dart';
import 'package:git_app/app/utils/view/container_widget.dart';
import 'package:git_app/routes/routes.dart';

import 'widget/login_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ContainerWithChild(
        height: height,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Card(
                color: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 50,
                shadowColor: AppColors.primary1,
                child: SizedBox(
                  width: width / 1.2,
                  height: height / 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "SignIn",
                        style: AppTextStyles.h1.copyWith(
                          color: AppColors.kBlack,
                        ),
                      ),
                      const LoginFormWidget()
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ButtonWidget(
                horizontal: 40,
                vertical: 10,
                fn: () {
                  Routes.nextScreen(
                    screen: const SignUpScreen(),
                  );
                },
                title: 'Sign Up',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
