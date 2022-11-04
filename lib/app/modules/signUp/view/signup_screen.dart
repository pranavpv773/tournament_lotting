import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/modules/get_start/view/get_start.dart';
import 'package:git_app/app/modules/login/view/widget/textform_widget.dart';
import 'package:git_app/app/modules/signUp/view_model/user_provider.dart';
import 'package:git_app/app/modules/utils/view/container_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.primary1,
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: ContainerWithChild(
            height: height,
            width: width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Card(
                    color: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SizedBox(
                      height: height / 1.3,
                      width: width / 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Text(
                              "Signup",
                              style: AppTextStyles.h1.copyWith(
                                color: AppColors.kBlack,
                              ),
                            ),
                          ),
                          Form(
                            key: context.read<UserNotifier>().signupKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: TextformsField(
                                              controller: context
                                                  .read<UserNotifier>()
                                                  .firstNameCtrl,
                                              title: "Firstname",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: TextformsField(
                                              controller: context
                                                  .read<UserNotifier>()
                                                  .lastNameCtrl,
                                              title: "Lastname",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                TextformsField(
                                  controller:
                                      context.read<UserNotifier>().emailCtrl,
                                  title: "Email",
                                  icon1: const Icon(Icons.email_outlined),
                                ),
                                TextformsField(
                                  controller:
                                      context.read<UserNotifier>().phonectrl,
                                  title: "Phone",
                                  icon1: const Icon(Icons.phone_callback),
                                ),
                                TextformsField(
                                  controller:
                                      context.read<UserNotifier>().passwordCtrl,
                                  title: "Password",
                                  icon1: const Icon(Icons.lock_outline),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Checkbox(
                                      value:
                                          context.watch<UserNotifier>().checked,
                                      onChanged: (value) {
                                        context.read<UserNotifier>().checkBox();
                                      },
                                    ),
                                    const Text(
                                      'Accept our terms and conditions ',
                                      style: TextStyle(
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonWidget(
                      horizontal: 40,
                      vertical: 10,
                      fn: () {
                        log("message");
                        context.read<UserNotifier>().signUpFn(context);
                      },
                      title: 'Sign Up',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
