import 'package:flutter/material.dart';
import 'package:git_app/app/modules/get_start/view/get_start.dart';
import 'package:git_app/app/modules/login/view_model/login_notifier.dart';
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
            icon: const Icon(Icons.lock),
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
        ],
      ),
    );
  }
}
