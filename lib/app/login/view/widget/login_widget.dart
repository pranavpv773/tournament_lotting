import 'package:flutter/material.dart';
import 'package:git_app/app/get_start/view/get_start.dart';
import 'package:git_app/app/home/view/home_screen.dart';
import 'package:git_app/app/home/view_model/home_provider.dart';
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const TextformsField(
            title: "Username",
            icon: Icon(Icons.person),
          ),
          const TextformsField(
            title: "Password",
            icon: Icon(Icons.lock),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ButtonWidget(
              horizontal: 40,
              vertical: 10,
              fn: () {
                context.read<HomeNotifier>().fetchStaredRepo();
                Routes.nextScreen(
                  screen: const HomeScreen(),
                );
              },
              title: 'Sign In',
            ),
          ),
        ],
      ),
    );
  }
}
