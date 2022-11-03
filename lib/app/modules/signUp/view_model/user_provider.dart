// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:git_app/app/modules/signUp/model/user_model.dart';
import 'package:git_app/app/modules/signUp/view_model/db_provider.dart';
import 'package:provider/provider.dart';

class UserNotifier with ChangeNotifier {
  final signupKey = GlobalKey<FormState>();
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final phonectrl = TextEditingController();
  signUpFn(BuildContext context) async {
    log("fn");
    log(emailCtrl.text);
    log(firstNameCtrl.text);
    log(lastNameCtrl.text);
    log(passwordCtrl.text);
    log(phonectrl.text);
    if (signupKey.currentState!.validate()) {
      log("signup");

      User user = User(
        email: emailCtrl.text,
        firstName: firstNameCtrl.text,
        lastName: lastNameCtrl.text,
        password: passwordCtrl.text,
        phone: int.parse(passwordCtrl.text),
      );
      await context.read<DbFuctions>().addUser(user);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Success'),
        ),
      );
    }
  }
}
