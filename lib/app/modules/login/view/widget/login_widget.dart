import 'package:flutter/material.dart';
import 'package:git_app/app/modules/get_start/view/get_start.dart';
import 'package:git_app/app/modules/login/view_model/login_notifier.dart';
import 'package:git_app/app/modules/signUp/view/signup_screen.dart';
import 'package:git_app/routes/routes.dart';
import 'package:provider/provider.dart';

import 'textform_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginNotifier>().loginKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          TextformsField(
            controller: context.read<LoginNotifier>().userName,
            title: "Username",
            icon: const Icon(Icons.person),
          ),
          TextformsField(
            controller: context.read<LoginNotifier>().password,
            title: "Password",
            obsecure: context.watch<LoginNotifier>().obsecure,
            icon1: IconButton(
              icon: context.watch<LoginNotifier>().obsecure
                  ? const Icon(Icons.remove_red_eye_outlined)
                  : const Icon(Icons.password),
              onPressed: () {
                context.read<LoginNotifier>().obSecureFn();
              },
            ),
            icon: const Icon(Icons.lock_outline),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ButtonWidget(
              horizontal: 40,
              vertical: 10,
              fn: () {
                context.read<LoginNotifier>().getLogin(context);
              },
              title: 'Sign In',
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("New to our Platform?"),
              TextButton(
                onPressed: () {
                  Routes.nextScreen(
                    screen: const SignUpScreen(),
                  );
                  context.read<LoginNotifier>().disposeCntrl();
                },
                child: const Text(
                  "Sign Up",
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
