import 'package:flutter/material.dart';
import 'package:git_app/app/app_styles/app_colors.dart';
import 'package:git_app/app/app_styles/app_text_styles.dart';
import 'package:git_app/app/get_start/view/get_start.dart';
import 'package:git_app/app/login/view/widget/textform_widget.dart';
import 'package:git_app/app/utils/view/container_widget.dart';

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
                      height: height / 1.8,
                      width: width / 1,
                      child: Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Signup",
                              style: AppTextStyles.h1.copyWith(
                                color: AppColors.kBlack,
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: const <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: TextformsField(
                                              title: "Firstname",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Row(
                                        children: const <Widget>[
                                          Expanded(
                                            flex: 6,
                                            child: TextformsField(
                                              title: "Lastname",
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const TextformsField(
                                  title: "Email",
                                  icon1: Icon(Icons.email_outlined),
                                ),
                                const TextformsField(
                                  title: "Phone",
                                  icon1: Icon(Icons.phone_callback),
                                ),
                                const TextformsField(
                                  title: "Password",
                                  icon1: Icon(Icons.lock_outline),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) {},
                                    ),
                                    const Text(
                                      'Accept our terms and conditions ',
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ButtonWidget(
                      horizontal: 40,
                      vertical: 10,
                      fn: () {
                        // Routes.nextScreen(
                        //   screen: const SignUpScreen(),
                        // );
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
